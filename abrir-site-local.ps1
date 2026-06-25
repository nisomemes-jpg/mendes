param(
  [switch]$NoOpen
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$startPort = 8088
$listener = $null
$siteUrl = $null

for ($port = $startPort; $port -lt ($startPort + 30); $port++) {
  $candidate = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Parse("127.0.0.1"), $port)

  try {
    $candidate.Start()
    $listener = $candidate
    $siteUrl = "http://127.0.0.1:$port/"
    break
  }
  catch {
    $candidate.Stop()
  }
}

if ($null -eq $listener) {
  throw "Nao foi possivel iniciar a previa local do site."
}

function Get-ContentType {
  param([string]$Path)

  switch ([System.IO.Path]::GetExtension($Path).ToLowerInvariant()) {
    ".html" { "text/html; charset=utf-8"; break }
    ".css" { "text/css; charset=utf-8"; break }
    ".js" { "text/javascript; charset=utf-8"; break }
    ".jpg" { "image/jpeg"; break }
    ".jpeg" { "image/jpeg"; break }
    ".png" { "image/png"; break }
    default { "application/octet-stream"; break }
  }
}

function Send-Response {
  param(
    [System.Net.Sockets.NetworkStream]$Stream,
    [int]$StatusCode,
    [string]$StatusText,
    [string]$ContentType,
    [byte[]]$Body
  )

  $header = "HTTP/1.1 $StatusCode $StatusText`r`nContent-Type: $ContentType`r`nContent-Length: $($Body.Length)`r`nConnection: close`r`n`r`n"
  $headerBytes = [System.Text.Encoding]::ASCII.GetBytes($header)
  $Stream.Write($headerBytes, 0, $headerBytes.Length)
  $Stream.Write($Body, 0, $Body.Length)
}

if (-not $NoOpen) {
  Start-Process ($siteUrl + "index.html")
}

Write-Host ""
Write-Host "Site aberto em: $($siteUrl)index.html"
Write-Host "Mantenha esta janela aberta enquanto estiver vendo o site."
Write-Host "Para fechar, aperte Ctrl+C ou feche esta janela."
Write-Host ""

try {
  while ($true) {
    $client = $listener.AcceptTcpClient()

    try {
      $stream = $client.GetStream()
      $reader = [System.IO.StreamReader]::new($stream, [System.Text.Encoding]::ASCII, $false, 1024, $true)
      $requestLine = $reader.ReadLine()

      while ($true) {
        $line = $reader.ReadLine()
        if ([string]::IsNullOrEmpty($line)) {
          break
        }
      }

      $requestPath = "index.html"

      if ($requestLine -match "^[A-Z]+\s+([^\s]+)") {
        $requestPath = [System.Uri]::UnescapeDataString($Matches[1].Split("?")[0]).TrimStart("/")

        if ([string]::IsNullOrWhiteSpace($requestPath)) {
          $requestPath = "index.html"
        }
      }

      $filePath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($root, $requestPath))
      $rootPath = [System.IO.Path]::GetFullPath($root)
      $isInsideRoot = $filePath.StartsWith($rootPath, [System.StringComparison]::OrdinalIgnoreCase)

      if (-not $isInsideRoot -or -not (Test-Path -LiteralPath $filePath -PathType Leaf)) {
        $body = [System.Text.Encoding]::UTF8.GetBytes("Arquivo nao encontrado")
        Send-Response -Stream $stream -StatusCode 404 -StatusText "Not Found" -ContentType "text/plain; charset=utf-8" -Body $body
        continue
      }

      $bytes = [System.IO.File]::ReadAllBytes($filePath)
      Send-Response -Stream $stream -StatusCode 200 -StatusText "OK" -ContentType (Get-ContentType -Path $filePath) -Body $bytes
    }
    finally {
      $client.Close()
    }
  }
}
finally {
  $listener.Stop()
}
