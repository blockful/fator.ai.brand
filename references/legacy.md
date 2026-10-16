# What changed, and where the old brand still lives

The Fator identity was re-documented from the commercial deck on Aug 19 2026. Two earlier systems
exist in files and memories; both are retired.

## April 2026 (LP prototype): retired

Warm cream `#f7f4ee` / `#efeae0`, near-black `#0f0e0c`, ochre accent `#c29a56`, IBM Plex Sans +
IBM Plex Mono, "no coloured buttons" rule. Source: early `social-media-design/references/projects/fator-ai.json`.

## May 2026: retired

| | May 2026 | Aug 2026 |
|---|---|---|
| light ground | `#e6ecf0` | `#fafaf8` |
| dark | `#0a1c1e` teal-black | `#202125` neutral graphite |
| cyan | `#a4f5ff` | `#bcf7fd` |
| display face | Gambarino serif | Switzer Regular/Medium |
| label face | IBM Plex Mono, 0.12em | Space Grotesk Medium, uppercase, 1px |
| corners | strictly 0 | 2px chip, 3px card, 4px LP badge |

`#1ac3d8` survived, now scoped to strokes and labels on light grounds. Three colours got tokens for
the first time: `#f2f2f2` grey (`bg/muted`), `#a9dde2` (`bg/chip-on-cyan`), `#ecf9f9` (`bg/wash-cyan`).
Gambarino did not die: it is still drawn inside the logo lockup, and nowhere else.

## Places that still carry old values (as of Sep 9 2026)

| Where | What is stale | Status |
|---|---|---|
| `fator.ai/CLAUDE.md` "Design tokens" table | `#0a1c1e`, Gambarino, IBM Plex Mono | Needs rewrite in the fator.ai repo; `src/styles/tokens.css` is already correct |
| `fator-html-presentation/templates/r2-criativos.html` | `.mono` tracking `.14em`, grey slide `#e9e9e8` | Works; align on next template edit (1px, and decide `#e9e9e8` vs `#f2f2f2`) |
| `fator-html-presentation/templates/rn-proposta.html` (was `fator-propostas/gerador-proposta.html`) | Brand pass done on Sep 14 2026: fonts 400/500 only, palette tokens, square bullets, no shadow | Verified with `brand-check.sh` |
| Drive folder PNGs | May logos may still be served | Re-export from `📦 Exportáveis` if a PNG shows the teal-black |
| Memory `project-fator-brand-refresh-aug-2026` | Said the LP code was still on the May palette | Updated Sep 9 2026: `tokens.css` is on the Aug palette |

Sibling skill references (`social-media-design`, `presentation-design`, `project-slides`) were
re-pointed to this skill on Sep 9 2026.

## Drift found in the current files (Sep 9 2026 audit of all 54 slides, the LP code, social and cards)

Do not copy these; do not churn old files to fix them either, unless you are editing that file anyway.

| Where | Drift |
|---|---|
| Deck slides | Logo vectors fill `#1C1D1F` and some titles `#1c1d1f` instead of `#202125`; chip fill varies between `#e9e9e8`, `rgba(32,33,37,.10)` and `rgba(28,29,31,.08)` inside one deck; chip y is 44 on some slides and 45 on others; card radius is 3 in the main deck and 4 in the short one; six title sizes exist (88, 68, 52, 48, 44, 36) where the scale has four |
| Deck slides | Space Grotesk used as a heading at 18, 26 and 52px; Switzer used for uppercase labels; IBM Plex Mono still set on four demo and dashboard slides |
| Deck slides | Four slides claim "o código é seu" or "o documento é seu". That copy is false, see SKILL.md §6 |
| Deck slides | One icon tile hand-redraws the OpenAI mark. A partner mark belongs in a tile, drawn from the vendor's own asset |
| Deck slides | The R2 pricing figures no longer match the Aug 19 2026 locked pricing |
| Deck file | Duplicate frame `1025:267`, stray instance `789:173`, hidden `929:229`, stacked duplicate photo layers, residual empty colour spans, overflowing text boxes |
| `fator.ai` repo | `CLAUDE.md` documents the v1 site (`#0a1c1e`, Gambarino, IBM Plex Mono, components that no longer exist). `public/logo.svg` still fills `#0A1C1E` and is the JSON-LD logo. `public/icons.svg` is a purple template sprite. Dead tracked assets: `step-*.svg`, seven `tech-*.svg`, `arq-curva-*.svg`, `arq-hub.svg`, `hero-hands.png` |
| `fator.ai` repo | Hard-coded colours outside the tokens: `#8e8e8e` in the FAQ icon, two error reds, the halftone and grid defaults. Unused tokens `--bg-chip-on-cyan`, `--fill-tile`, `.type-link` |
| Figma LP page | The whole wireframe is the May 2026 system. The live code is the truth for the web |
| Social page | Two landscape templates still use Gambarino headlines |
| Covers | LinkedIn cover taglines are set in Gambarino; they should be Switzer |
| Cards vs site | `contact@fator.ai` and `+55 11 99122-2055` on the cards, `contato@fator.ai` and another number in the site footer |
| og-image | 1040 x 560 in the file and in the meta tags; the platform standard is 1200 x 630 |

## Decisions log

- 2026-09-09: skill written from the full audit (brand guide, 54 slides, five deck pages, social,
  business card, cover, og-image, and the live LP code). Recorded the two dialects, resolved five
  disagreements (SKILL.md §9) and left three questions for Isadora (§10). Added the deck template,
  the per-medium references and the brand-check script.
