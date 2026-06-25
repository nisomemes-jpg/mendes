# Como publicar e editar o site da paróquia

## 1. O que deve ir para o GitHub

Envie o conteúdo inteiro da pasta `paroquia-lourdes-site`.

Não envie só o `index.html`, porque as imagens ficam dentro da pasta `assets`.

Se no site publicado as fotos não aparecerem, quase sempre é porque a pasta `assets`
não foi enviada para o GitHub, ou foi enviada fora do lugar.

Arquivos importantes:

- `index.html`
- `padre-joao-maria.html`
- `oracoes-padre-bianor.html`
- `comunicacoes.html`
- `styles.css`
- `script.js`
- `config.js`
- `assets`
- `.nojekyll`

Dentro da pasta `assets`, confira se existem estes arquivos:

- `brasao.jpg`
- `igreja-fachada.jpeg`
- `igreja-altar-crucifixo.jpeg`
- `igreja-presbiterio.jpeg`
- `igreja-nave.jpeg`
- `padre-bianor.jpg`
- `padre-joao-maria.jpg`
- `dizimo.jpeg`
- `inscricao-coroinhas.jpeg`
- `inscricao-leitores.jpeg`
- `pastoral-promocao-humana.jpeg`

## 2. Como publicar no GitHub Pages

1. Entre em https://github.com
2. Clique em `New repository`.
3. Dê um nome ao repositório, por exemplo: `paroquia-lourdes`.
4. Marque o repositório como `Public`.
5. Crie o repositório.
6. Envie todos os arquivos da pasta `paroquia-lourdes-site`.
7. Atenção: envie também a pasta `assets` inteira. No GitHub, ela deve aparecer como uma pasta chamada `assets` na tela principal do repositório.
8. Entre em `Settings`.
9. Clique em `Pages`.
10. Em `Source`, escolha `Deploy from a branch`.
11. Em `Branch`, escolha `main`.
12. Em pasta, escolha `/(root)`.
13. Clique em `Save`.

Depois de alguns minutos, o GitHub vai mostrar o link do site.

## 3. Como editar com o passar do tempo

Para trocar links de WhatsApp, Instagram, mapa ou grupo de liturgia:

1. Abra o arquivo `config.js`.
2. Troque o link entre aspas.
3. Salve.
4. Envie o arquivo atualizado para o GitHub.

Para mudar textos:

1. Edite o arquivo da página desejada.
2. Página principal: `index.html`.
3. Página do Padre João Maria: `padre-joao-maria.html`.
4. Página das orações: `oracoes-padre-bianor.html`.
5. Página das comunicações: `comunicacoes.html`.
6. Salve e envie para o GitHub.

Para atualizar as comunicações semanais:

1. Abra o arquivo `comunicacoes.html`.
2. Procure a parte `Comunicações semanais`.
3. Troque os textos, links ou nomes das imagens dos avisos.
4. Se trocar imagem, coloque a nova imagem dentro da pasta `assets`.
5. Salve e envie `comunicacoes.html` e a pasta `assets` atualizada para o GitHub.

Para trocar imagens:

1. Coloque a nova imagem dentro da pasta `assets`.
2. Use nomes simples, sem acentos e sem espaços.
3. Exemplo: `nova-foto-igreja.jpg`.
4. Troque o nome da imagem no arquivo da página.

## 4. Cuidados importantes

- Mantenha a pasta `assets` junto dos arquivos do site.
- Não apague `index.html`, pois ele é a entrada principal do site.
- Depois de editar no GitHub, aguarde alguns minutos para a mudança aparecer no site.
- Se a imagem não aparecer, confira se o nome no código está igual ao nome do arquivo.
