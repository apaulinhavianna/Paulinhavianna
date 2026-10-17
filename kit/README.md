# Kit visual — Paulinha

Estética **scrapbook / diário de colagem** para Instagram lifestyle: papel creme, selos serrilhados,
polaroids, etiquetas rosa, pílulas brancas, crachá "hello", estrelinhas, elementos de iPhone.

Tudo é feito em HTML e vira imagem (posts, carrosséis, capas) ou vídeo (Reels, com Hyperframes).

## Peças do kit (`kit.css`)

| Peça | Classe |
|---|---|
| Cores | `--papel`, `--creme`, `--cafe`, `--rosa`, `--manteiga`, `--azul-ios`, `--matcha`, `--vinho`, `--dourado` |
| Título grosso | `.t-grosso` (Bricolage Grotesque) |
| Título fino / itálico | `.t-fino`, `.t-fino-it` (Bodoni Moda) |
| Letra à mão | `.t-mao` (Homemade Apple) |
| Texto branco sobre foto | `.sobre-foto` |
| Foto de fundo | `.foto-fundo` |
| Pílula branca | `.pill` |
| Etiqueta rosa | `.tag` |
| Crachá "hello" | `.cracha` com `.topo` e `.nome` |
| Polaroid | `.polaroid` com `.img` e `.leg` |
| Fita adesiva | `.fita`, `.fita.amarela` |
| Selo serrilhado | `.selo` com `.miolo` |
| Conversa do iMessage | `.chat` com `.bolha.cinza` / `.bolha.azul` |
| Lembretes do iPhone | `.lembretes` com `.item` e `.check` |
| Faixas | `.faixa-amarela`, `.faixa-azul` |
| Estrela dourada | `.estrela` |
| Textura de papel | `.papel-grao` (no `body`) |
| Indicador do carrossel | `.paginas` |

## Exemplos

- `exemplos/post-anos80/` — post de foto: molde **pílulas + mãozinha** e molde **crachá**.
- `exemplos/carrossel-kit/` — carrossel de 3 slides (feito com a skill `carousel-builder`).
- `exemplos/colagem/` — primeiro teste da estética, em colagem.
- `exemplos/reel-legenda/` — Reel vertical com legenda automática palavra por palavra (Hyperframes + Whisper).

## Fotos

As fotos ficam em `fotos/` e as imagens prontas em `renders/`. **Essas pastas não vão para o GitHub**
(o repositório é público). Numa sessão nova, envie a foto de novo na conversa.

## Numa sessão nova

```bash
bash kit/ferramentas/preparar-sessao.sh
```

Instala o Whisper, o Playwright e confere o Hyperframes (leva alguns minutos).

Gerar um post:

```bash
~/tools/venv/bin/python kit/ferramentas/render.py kit/exemplos/post-anos80/pilulas.html kit/renders/pilulas.png
```

Tamanhos: post do feed `1080 1350` (padrão) · capa de Reels e Stories `1080 1920`.

Renderizar um Reel (dentro da pasta do projeto Hyperframes):

```bash
NODE_USE_ENV_PROXY=1 npx hyperframes render -o reel.mp4
```

A rede do ambiente precisa liberar `huggingface.co` (modelos do Whisper) e o Google Fonts.
