# Como atualizar o site sem criar outro

O endereço atual `https://nisomemes-jpg.github.io/mendes/` vem do repositório `nisomemes-jpg/mendes` no GitHub. Para manter o mesmo link, você deve enviar estes arquivos para esse mesmo repositório.

Este pacote contém uma página completa. Como os arquivos atuais do site não puderam ser baixados automaticamente neste ambiente, confira se há seções antigas que você deseja manter antes de substituir o `index.html`.

## Publicar esta atualização

1. Entre no GitHub e abra o repositório `mendes`.
2. Envie/substitua os arquivos `index.html`, `style.css`, `script.js` e `comunicados.js`.
3. Envie também a pasta `assets` com as imagens.
4. Confirme a alteração no botão verde de commit.
5. Aguarde alguns minutos e abra novamente `https://nisomemes-jpg.github.io/mendes/`.

Se o repositório atual tiver outras páginas, fotos ou seções importantes, mantenha esses arquivos e encaixe a parte de comunicados no `index.html` existente.

## Editar avisos depois

Para trocar os comunicados semanais ou fixos, edite somente o arquivo `comunicados.js`.

Cada aviso tem:

- `titulo`: nome do aviso.
- `etiqueta`: frase curta que aparece acima do título.
- `imagem`: caminho da imagem, por exemplo `assets/inscricao-coroinhas.jpeg`. Se não tiver imagem, deixe vazio: `""`.
- `texto`: resumo do aviso.
- `detalhes`: linhas com as informações principais.
- `links`: botões com formulário ou WhatsApp.

## Observação sobre o Batismo

A imagem do Batismo não chegou junto com os arquivos recebidos aqui. Deixei um modelo comentado no fim de `comunicados.js` para adicionar esse aviso quando a imagem/informação for enviada.
