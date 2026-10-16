# Figma node map: Fator AI brand

File `5NeLWpK0hvQIZqDHnt03LJ` ("AI-Product"). `https://www.figma.com/design/5NeLWpK0hvQIZqDHnt03LJ`

Before any write, load `figma-design` and `figma-use`. Pull colours from the **`Brand`** variable
collection and type from the **`Deck/*`** and **`LP/*`** text styles. Never type a hex.

## Page `🎯 Marca` (`723:357`): the visual guide, eight 1280×720 frames

| Frame | Node | What it holds |
|---|---|---|
| 1 · Como usar | `723:358` | Cover: mesh over graphite, ruler at y360, `[ brandbook ]` label, Deck/Capa title |
| 2 · Logo | `723:359` | Three approved grounds (`729:9` paper, `729:13` graphite, `729:17` cyan), symbol trio (`730:5`), usage rules (`730:15`) |
| 3 · Cor | `723:360` | Ramp (`735:37`) and the colour/token/use table (`735:52`) |
| 4 · Tipografia | `723:361` | Switzer card (`727:9`), Space Grotesk card (`727:14`), the Deck/* scale (`727:21`) |
| 5 · Recursos visuais | `723:362` | Twelve repertoire devices with demo + rule (`731:8`) |
| 6 · Padrões | `723:363` | Stat card (`736:45`), row with tile (`736:53`), slide anatomy (`737:37`) and fixed measures (`737:45`) |
| 7 · Faça e não faça | `723:364` | Do/don't columns (`738:41`), "what changed since May 2026" (`741:420`) |
| 8 · Arquivos | `723:365` | Drive link, font sources |

Reusable instance: the background mesh is the component behind `741:70` (also `731:48`).

## Page `📦 Exportáveis` (`740:2`): logo artboards

| Artboard | Node | Size |
|---|---|---|
| logo-fundo-claro | `740:3` | 1160×301 |
| logo-fundo-escuro | `740:5` | 1160×300 |
| logo-fundo-ciano | `806:437` | 1160×300 |
| logo-fundo-ciano-escuro | `806:439` | 1160×300 |
| simbolo-fundo-claro / escuro / ciano | `740:7` / `740:10` / `740:13` | 512×512 |
| logo-sobre-papel / cinza / ciano / grafite (with 64px clear space) | `744:2` / `744:4` / `744:6` / `744:8` | 1128×387 |
| simbolo-sobre-papel / cinza / ciano / grafite / ciano-sobre-grafite (with clear space) | `744:418` / `744:421` / `744:424` / `744:427` / `744:430` | 512×512 |

The `fatorlogo` SVG symbol used in HTML decks was exported from node `768:147`.

## Variables (collection `Brand`, WEB code syntax = token name)

`bg/page` `#fafaf8` · `bg/dark` `#202125` · `bg/muted` `#f2f2f2` · `bg/wash-cyan` `#ecf9f9` ·
`bg/chip-on-cyan` `#a9dde2` · `accent/cyan` `#bcf7fd` · `accent/cyan-dark` `#1ac3d8` ·
`text/primary` `#fafaf8` · `text/inverted` `#202125` · `text/muted` `#202125` at 72% ·
`border/dark` `#202125`. The LP code adds the derived `border/dark-blue`, `border/grey`,
`text/muted-light`, `text/accent-*`, `border/primary-*` and `fill/tile` (see `tokens.css`).

## Text styles

`Deck/Capa`, `Deck/Declaração`, `Deck/Título`, `Deck/Stat Número`, `Deck/Stat Legenda`,
`Deck/Card Título`, `Deck/Corpo`, `Deck/Badge`, `Deck/Rótulo`, `Deck/Fonte` (values in
`tokens.json`). `LP/*` styles mirror `fator.ai/src/styles/base.css` `.type-*` classes.

## The whole file, page by page

Fifteen pages. Which one is authoritative depends on the medium.

| Page | Node | Holds | Authority |
|---|---|---|---|
| `💡 Cover` | `0:1` | File cover 1040 x 560: graphite, 40px cyan graph-paper, knockout panel with the lockup | The cover recipe |
| `👩‍💻 Landing Page` | `17:179` | LP wireframe (1440 x 7693), five alternates, og-image `290:323`, 14 logo frames, brand moodboard `24:194` | **Stale for the web.** The wireframe is the May 2026 system (Gambarino, IBM Plex Mono, `#e6ecf0`, `#a4f5ff`). The live code wins |
| `👁️ Deck` | `593:2461` | The main commercial deck, 15 slides plus a duplicate | The deck grammar |
| `👁️ Deck: Versão Curta` | `629:870` | 11-slide short version with layout variants | Variants worth cloning |
| `👁️ Deck - Solução para cliente` | `655:138` | 8 slides: how it works, integration, validation, roadmap, pricing, next steps | Roadmap and pricing archetypes |
| `👁️ Deck -  Parceiros` | `928:522` | 6 slides: cover, about, commission, how it works, contacts, closing | Contact-card archetype |
| `R2 Deck` | `768:138` | The 11-slide live mapping deck plus one LinkedIn post | Mirrors the R2 HTML template |
| `🎨 Social Media` | `304:182` | Templates section, posts section, company and person covers | Social recipes; the landscape templates are legacy |
| `Business Card` | `1044:1655` | 5 front and 5 back variants, 90 x 50mm with 3mm bleed | Print recipe |
| `📦 Exportáveis` | `740:2` | 16 logo and symbol artboards on every ground | Logo exports |
| `🎯 Marca` | `723:357` | The eight-frame brand guide | The written brand |
| `---`, `----`, `---` | `742:610`, `742:611`, `742:612` | Empty separators | none |

## Deck pages: the slide frames

Main deck `593:2461`: `593:2463` Capa · `593:2479` O mercado · `593:2586` O mercado, notícias ·
`593:2818` Objetivo · `593:2791` Realidade · `593:2639` Caminhos · `593:2840` Escada (duplicate at
`1025:267`) · `593:2714` Sobre nós · `616:405` Sobre nós, citações · `593:2736` Sobre nós, processo ·
`593:2768` Portfólio · `616:464` Demonstrativo · `616:488` Demonstrativo 2 · `593:2471` Fechamento.

Solução `655:138`: `656:70` Capa · `656:78` Como funciona · `668:70` Integração · `656:176`
Validação · `656:375` Roadmap · `656:1275` Investimento · `656:1304` Próximos passos · `656:1380`
Fechamento.

Parceiros `928:522`: `929:104` Capa · `929:112` Sobre nós · `929:134` Comissão · `929:160` Como
funciona · `929:200` Contatos · `929:227` Fechamento.

Components on the deck page: `Deck/Logo — Light` `349:11` and `Deck/Logo — Dark` `349:21` (both on
the May palette, never instanced, **do not use**), `Deck/Grid Texture` `393:84` (orphan 120px grid
at 5%, not what the slides use). The texture the slides actually carry is a `Base grid` instance of
a "Golden cannon grid" component: 28 hairlines in `#FAFAF8` at 50% stroke, horizontals at y 45,
180, 360, 540, 676 and verticals at x 40, 80, 160, 320, 640, 960, 1120, 1200, 1240, plus 14
diagonals, and a hidden rule-of-thirds layer in off-palette `#3146FF`.

## Social and card frames

Social `304:182`: current posts are the `1041:*` ids (800 x 1000, Switzer headlines). The two
landscape templates (1529 x 800) still set Gambarino at 100 and 88: legacy. Company covers
`445:199` (current) and `327:140` (v1, clipped tagline); person covers `428:199` (current) and
`327:1011` (v1).

Business card `1044:1655`: current pair is front `1073:7601` (cyan, icon-only 520px flush-left) and
back `1073:7618` (graphite, lockup top-left, Space Grotesk contacts). The expressive alternative is
front `1068:500` with the halftone spark.
