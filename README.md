# Site da Paróquia Nossa Senhora de Lourdes

Este site é estático e pode ser hospedado no GitHub Pages. Ele também abre sem internet no computador, porque as páginas, textos e imagens ficam dentro desta própria pasta.

## Links já configurados

Os links oficiais ficam no arquivo `config.js`:

```js
window.SITE_LINKS = {
  whatsappParoquia: "https://wa.me/558496310213",
  grupoLiturgia: "https://chat.whatsapp.com/GjrgcRf5Yq4DUZo5Z4OcH4?s=sh&p=a&mlu=4",
  instagram: "https://www.instagram.com/pnslnatal?igsh=anJhbXhjcjBpNjY2",
  mapa: "https://maps.app.goo.gl/Eyxoo6FFUTk1SJMa6"
};
```

Se algum link mudar depois, edite somente esse arquivo.

## Como abrir no seu navegador

Para visualizar no computador antes de publicar:

1. Abra esta pasta do site.
2. Clique duas vezes em `CLIQUE-AQUI-PARA-ABRIR.html`.
3. Se preferir, também pode clicar duas vezes em `abrir-site.bat`.

Importante: não tire o `index.html` de dentro da pasta. Ele precisa ficar junto da pasta `assets`, porque é nela que estão as imagens.

## Páginas do site

- `index.html`: página principal da paróquia.
- `padre-joao-maria.html`: página sobre o Servo de Deus Padre João Maria.
- `oracoes-padre-bianor.html`: orações usadas nas celebrações e transmissões.
- `styles.css`: aparência do site.
- `script.js`: funcionamento do menu e dos links.
- `assets/`: imagens usadas no site.

## Como publicar no GitHub Pages

1. Crie um repositório no GitHub.
2. Envie todos os arquivos desta pasta para o repositório.
3. No GitHub, entre em `Settings`, depois `Pages`.
4. Em `Build and deployment`, selecione `Deploy from a branch`.
5. Escolha a branch `main` e a pasta `/root`.
6. Salve e aguarde o GitHub gerar o link do site.
