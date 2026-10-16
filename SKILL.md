---
name: fator-visual-id
description: "Canonical Fator AI visual identity, and the front door to every Fator deliverable: the R1 deck, the R2 mapeamento and the RN proposal are already built and ready to fill, plus any medium you need to make from scratch: presentation, Google Slides, spreadsheet, report, PDF, website, product or dashboard UI, document, one-pager, social post, LinkedIn cover, business card, print, chart. Carries the seven-colour graphite-to-paper ramp with token names, Switzer plus Space Grotesk with the deck, web and document scales, the logo files and rules, flat surface specs, the device repertoire (chip, bracket label, ruler, connector, icon tile, stat card, cyan highlight), a clone-ready 1280x720 deck template and a runnable brand-check script. Load it before designing or writing any Fator deliverable, and to answer 'is this on brand?'. Triggers: 'identidade visual da Fator', 'brand da Fator', 'cores da Fator', 'tipografia da Fator', 'logo da Fator', 'deck da Fator', 'apresentação da Fator', 'relatório da Fator', 'planilha da Fator', 'post da Fator', 'cartão de visita', 'design system da Fator', 'isso está no padrão da Fator?', 'proposta pro cliente', 'monta a R1', 'monta a R2', 'deck pra reunião'. Start at §0: it routes you to the file to open. Mechanics live in fator-html-presentation and social-media-design. This skill IS the public repo blockful/fator.ai.brand: logo/, colors/, typography/ and illustrations/ hold the exported assets, README.md is the human-facing brand kit, and the LP repo (fator.ai.lp) is the source the assets and tokens are copied from."
---

# Fator AI visual identity

This repo, `blockful/fator.ai.brand`, is the **single source of truth** for how Fator AI looks, in
every medium. It is both the brand kit a person browses (start at [`README.md`](README.md)) and the
skill an agent loads (this file). Every other Fator skill pulls colour, type, logo and shape from
here and adds only its own mechanics. When another file disagrees with this one, this one wins and
the other file gets fixed.

**Where the files come from** (Isadora's ruling, Oct 16 2026): assets and tokens are taken from the
landing-page repo, `blockful/fator.ai.lp`. [`colors/tokens.css`](colors/tokens.css) is that repo's
`src/styles/tokens.css` copied verbatim; the logo geometry comes from its shipped vectors (with the
ink corrected, see §4). When the LP changes, re-copy; do not edit the copies here by hand.

| Folder | Holds |
|---|---|
| [`logo/`](logo/) | Lockup, symbol and favicon: `currentColor` masters plus light/dark SVG and PNG exports (§4) |
| [`colors/`](colors/) | `tokens.css` (verbatim from the LP) and `tokens.json` (machine-readable, with usage notes) |
| [`typography/`](typography/) | Where to download each face. The base64 `fonts-embedded.css` stays in the private skills repo (§3) |
| [`illustrations/`](illustrations/) | The malha mesh, screen and flattened print versions (§8) |
| [`social-media-cover/`](social-media-cover/) | The og-image shipped by the LP |
| [`ui/`](ui/) | The platform (dashboard) design-system handoff: four-tier variables, the `UI/*` type scale, 30 component specs, `tokens.css` + `theme.css` ready for shadcn |
| [`references/`](references/) | Per-medium deep guides: deck, web, social/print, documents, Figma node map, devices, legacy |
| [`templates/`](templates/) | `deck.html`, the clone-ready 1280x720 deck |
| [`scripts/`](scripts/) | `brand-check.sh`, the runnable gate (§8) |

The written rules were measured from three sources, not from memory: the eight-frame brand guide in
Figma (page `🎯 Marca`, `723:357`), all 54 slides of the five commercial decks plus the social,
business-card and cover artboards in the same file, and the live landing-page code. Isadora's ruling
of Aug 19 2026 stands: **the commercial deck is the truth** for the written rules, and where a newer
artifact deliberately extends it, §7 says so.

**Fastest path.** The three commercial pieces are already built. Do not start them from scratch:
open the file, fill it, export. They live in the team's internal skills repo, in
`fator-html-presentation/templates/`, each with a worked example and its PDF in that skill's
`examples/`.

| You need | Open | It gives you |
|---|---|---|
| The R1 deck | `templates/r1-demo.html` | 14 slides to send after the meeting; add `#curto` for the 9-slide version you present |
| The R2 mapeamento | `templates/r2-criativos.html` | the live call deck: fillable fields, price calculator, report export |
| The RN proposal | `templates/rn-proposta.html` | the generator: pick an offer preset, fill, export a PDF, a frozen HTML or a share link |

Everything else routes below.

## 0. Route: what are you making?

| Deliverable | Read | Then use |
|---|---|---|
| A commercial piece (R1, R2, RN) | `fator-html-presentation` §1 for the family, §7 for the R2, its `references/rn-proposta.md` for the proposal | the templates above. Never rebuild one |
| Any other deck, presentation, slides | [`references/deck.md`](references/deck.md) + [`templates/deck.html`](templates/deck.html) | `fator-html-presentation` for the sales gates, `html-presentation` for fit and PDF, `presentation-design` if it must live in Figma |
| Google Slides deck | [`references/deck.md`](references/deck.md) §7 | the `slides` skill for the API mechanics. Switzer does not exist in Slides: §7 rules the substitution |
| Website or landing page | [`references/web-ui.md`](references/web-ui.md) | the `fator.ai.lp` repo's own components; `frontend-design` for engineering |
| Product or dashboard UI | [`ui/README.md`](ui/README.md), then [`references/web-ui.md`](references/web-ui.md) §6 | copy `ui/tokens.css` + `ui/theme.css`, install shadcn as normal |
| A PDF a client or lead will see (forwarded material, WhatsApp piece, annex) | [`references/deck.md`](references/deck.md) + [`templates/deck.html`](templates/deck.html) | **Landscape deck, never an A4 document.** Isadora's ruling, Sep 2026: an A4 portrait lead piece was rejected as not visual |
| Internal spreadsheet, report, document, one-pager, chart | [`references/data-and-reports.md`](references/data-and-reports.md) | `dataviz` for the chart form |
| Social post, carousel, LinkedIn cover | [`references/social-and-print.md`](references/social-and-print.md) §1-§2 | `social-media-design` for the queue and handoff |
| Business card, print, signage, og-image | [`references/social-and-print.md`](references/social-and-print.md) §3-§5 | |
| Anything in Figma | [`references/figma.md`](references/figma.md) for node ids | `figma-design` + `figma-use`, both mandatory |
| Copy only | §6 below | `copywriting` |

Tokens to paste: [`colors/tokens.css`](colors/tokens.css). Machine-readable:
[`colors/tokens.json`](colors/tokens.json). Devices as HTML:
[`references/patterns.md`](references/patterns.md). What changed and where the old brand still
lives: [`references/legacy.md`](references/legacy.md).

## 1. The identity in five rules

1. **Graphite and paper do the work.** `#202125` and `#fafaf8` are the brand. Everything else is
   support.
2. **One cyan highlight per piece.** Cyan marks the right answer. Two highlights cancel each other.
3. **Switzer says it, Space Grotesk labels it.** Never above Medium 500, in either.
4. **Flat, drawn, nearly square.** 1px and 2px rules, radius 2 to 3px, no shadow, no gradient, no
   glow.
5. **Every number cites its source.** In `Deck/Fonte` style, under the number, always.

## 2. Colour: seven colours, one ramp

Pull the **token**, never a typed hex. Several tokens resolve to the same colour on purpose, and a
colour is listed once even when four tokens point at it.

| Colour | Hex | Tokens | Use |
|---|---|---|---|
| Grafite | `#202125` | `bg/dark` · `text/inverted` · `border/dark` · `fill/tile` (6%) | Dark ground, text on light, card border, icon tile |
| Ciano de traço | `#1ac3d8` | `accent/cyan-dark` · `text/accent-dark` · `border/primary-dark` | Strokes, labels, links and accents **on light grounds**; favicon |
| Ciano de chip | `#a9dde2` | `bg/chip-on-cyan` | The section chip when the ground is cyan |
| Ciano | `#bcf7fd` | `accent/cyan` · `text/accent-light` · `border/primary-light` | **The** highlight: one card, one row, one span, or the whole slide. Accents on graphite |
| Ciano lavado | `#ecf9f9` | `bg/wash-cyan` | Diagram hatch, selected-row wash |
| Cinza | `#e9e9e8` deck · `#f2f2f2` code | `bg/muted` | Chip on paper, muted panel, and a full grey slide ground |
| Papel | `#fafaf8` | `bg/page` · `text/primary` | Default ground, text on graphite |

Documented derivations, allowed: `#404b51` rails on graphite, `rgba(32,33,37,.12)` rails on paper,
`rgba(250,250,248,.6)` and `rgba(188,247,253,.6)` muted on graphite, `rgba(32,33,37,.06)` tile fill.
Error red is `#c0392b` on paper and `#ff9a9a` on graphite. The product UI (v3 screens) adds two:
`#89898b`, its solid muted text, and `#f9ebe9`, the wash behind a destructive icon (see `ui/`).
**Nothing else.** The brand ships no
green, no amber, no purple: if a status needs a third state, ask before inventing one.

Rules: paper is the default ground; graphite is for covers, closings and dark bands; cyan is never a
default ground, it is a highlight slide or a highlight element. Bright cyan on dark, dark cyan on
light, never swapped. Muted text is graphite at reduced opacity, never a new grey.

## 3. Type: two families

| Family | Weights | Role |
|---|---|---|
| **Switzer** | Regular 400, Medium 500 | Everything the reader reads: titles, body, statistic numbers, captions, sources |
| **Space Grotesk** | Medium 500 only, uppercase, +1px | Labels: section chip, bracket label, eyebrow, table header, button label, meta key, index number |

```html
<link href="https://api.fontshare.com/v2/css?f[]=switzer@400,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
```

Offline or forwarded files embed `fonts-embedded.css` instead. That file is NOT in this public
repo (Switzer's Fontshare licence forbids redistributing the font files); it lives in the team's
private skills repo, inside the `fator-visual-id` skill.

- **Never 600 or 700.** Switzer Medium is the heaviest weight in the brand.
- **Gambarino lives only inside the logo lockup.** Say this out loud in any handoff or a designer
  will put it back in a headline. **IBM Plex is retired**, in both Sans and Mono.
- Space Grotesk sets a display headline **only on the website** (see §7). In a deck, a document or
  a print piece, titles are Switzer.

Three scales, one per dialect: deck sizes in [`references/deck.md`](references/deck.md) §3, web
primitives in [`references/web-ui.md`](references/web-ui.md) §3, document sizes in
[`references/data-and-reports.md`](references/data-and-reports.md) §2.

## 4. Logo

All files live in [`logo/`](logo/), geometry taken from the landing page's shipped vectors:

| File | What it is |
|---|---|
| [`fator-logo.svg`](logo/fator-logo.svg) | Lockup, 465 x 120, `currentColor`: one file serves every ground. **Default for HTML work** |
| [`fator-icon.svg`](logo/fator-icon.svg) | Symbol tile, 28 x 28, `currentColor` |
| `fator-logo-light.svg/.png` | Lockup in graphite `#202125`, for paper and cyan grounds |
| `fator-logo-dark.svg/.png` | Lockup in paper `#fafaf8`, for graphite grounds |
| `fator-icon-light/-dark.svg/.png` | The symbol tile in the same two inks |
| [`favicon.svg`](logo/favicon.svg) | The symbol in cyan `#1ac3d8`, favicon only. Verbatim from the LP |

The LP's own `public/logo.svg` still fills the retired May teal `#0a1c1e`
([`legacy.md`](references/legacy.md) documents it); these exports keep its geometry and correct the
ink to graphite. Do not re-export from that file without recolouring.

- **Three approved grounds, chosen by contrast:** paper (default), graphite (cover and closing),
  cyan (highlight). Graphite lockup on paper and cyan, paper lockup on graphite.
- **The lockup is the default.** The symbol alone is for avatar, favicon and signature.
- Clear space is half the symbol height. Minimum size: symbol 24px tall, lockup 96px wide.
- Deck placement: 108 x 28 top-right on inner slides; 232 x 60 top-left on the cover and closing.
- Do not recolour beyond the two inks, tilt, shadow, redraw the symbol, or reset the word.
- In HTML, inline it once as `<symbol id="fatorlogo">` and place it with `<use>`. Never paste the
  paths twice.
- **Do not use the `Deck/Logo` Figma components:** they still carry the May 2026 palette and no
  slide instances them.

## 5. Shape, line and surface

| Element | Spec |
|---|---|
| Deck card | 2px `border/dark`, radius 3, padding 20, inner gap 20 |
| Web card and panel | 1px `border/grey`, radius 3 to 4, no shadow |
| Chip | radius 2, padding 6px 8px, Space Grotesk 14 uppercase |
| Button | 1px border, radius 2, padding 12px 20px, Space Grotesk label |
| Rule | 1px on screen and in documents, 2px in decks. End squares 8px where it divides a cover |
| Connector | 1px or 2px line ending in a 12px square node |
| Icon tile | square, `fill/tile`, radius 2, 2px line glyph inside |
| Bullet | a 7px cyan **square**, never a disc, never a text glyph |
| Avatar and status pill | the only round shapes: `50%` and `999px` |

Radius never exceeds 4px. No shadow, gradient, blur or glow, with exactly one exception documented
in [`references/web-ui.md`](references/web-ui.md) §4: a product window depicted inside a marketing
page. Do not carry it anywhere else. A hard-stop gradient that draws a rule or a lattice is a grid,
not a gradient, and is fine.

Icons are Material Symbols Outlined at 16, 18 or 24px in `currentColor`, or hand-drawn 2px line
glyphs inside a tile. Never a second icon family, never an emoji, never `→` or `›` as an icon.

Imagery: real photos of the team and the work, `filter: grayscale(1)` on the web, an uppercase
caption underneath. No stock photography, no people smiling at the camera, no robot or AI
illustration. When there is no real photo, use a device from the repertoire instead.

## 6. Copy and numbers

- Short declaratives, 8 to 18 words, often in two beats. Titles are 4 to 6 words, sentence case, no
  final period. Second person for the client, first person plural for Fator.
- **No em or en dash, ever.** Colons introduce, semicolons balance, parentheses gloss.
- Labels are written lowercase in the source and uppercased by the style, so the copy stays readable.
- Numbers are PT-BR: `1.284`, `R$ 0,42`, `98,4%`, `24/7`. The unit is stated once.
- **Banned:** "studio" in any language, transformação, jornada, parceiro, empower, leverage,
  AI-powered, unlock, synergy.
- **Never claim** that the client owns the code or the models, a certification Fator does not hold
  (ISO, SOC 2), or "100% seguro". Four slides in the current decks still say "o código é seu": that
  copy is false and must not be reproduced. The true claim is security-engineering origin,
  controlled access, auditable executions and LGPD from the architecture.

## 7. Two dialects, one brand

The brand has one core and two surface dialects. The deck dialect came from the Aug 19 2026 guide;
the screen dialect is the landing page rebuilt on Sep 1 2026 **for** that refresh, so it is the
newer artifact and it wins on screen. Everything in §1 to §6 is shared. These differ:

| | Deck, document, print | Website, product UI |
|---|---|---|
| Structure | 2px borders around cards | 1px hairlines and rails, cards are the exception |
| Grey | `#e9e9e8` | `#f2f2f2` |
| Muted text | graphite at 72%, so it survives a projector | graphite at 50% |
| Display type | Switzer, always | Space Grotesk uppercase for the hero and the closing CTA only |
| Radius | 2 to 3px | 2 to 4px, 6 to 8px on a depicted product window |
| Cyan density | one element per slide | one per view, and the hero may be cyan-on-graphite throughout |
| Motion | none | a documented system, 180 to 480ms |

Pick the dialect from the medium, then never mix them in one deliverable.

## 8. Check before you deliver

```bash
bash <this-skill>/scripts/brand-check.sh <file-or-dir>      # add --copy-only for prose
```

It gates retired palettes, retired typefaces, bold weights, shadow and gradient, radius above 4px,
off-palette hex, external images, dashes, banned vocabulary and false claims. Exit 0 is clean.

Then **look at it**, because no grep catches these:

- one cyan highlight, counted as elements, not as coloured objects;
- titles left-aligned, never centred;
- a source under every number;
- no widow word, no phrase broken across lines leaving one or two words stranded;
- a deck's light and dark rhythm unbroken, and no two cyan slides adjacent;
- nothing on a slide explaining how the meeting is run;
- one fact in one place per piece.

For decks, render every slide and read them; `html-presentation` carries the harness. Use the
headless Chromium the machine has: Edge on the Windows machine (Playwright's Chromium lacks
system libraries there), Brave on the Mac
(`/Applications/Brave Browser.app/Contents/MacOS/Brave Browser`).

**PDF exports have two extra gates** (both bugs found Sep 2026, fixed in
[`templates/deck.html`](templates/deck.html); mechanics in `fator-html-presentation` §9):
verify every page draws content, because the active slide's entrance animation can print blank
intermittently; and open the result in Preview, because an SVG background with group opacity
(the raw malha) renders as a grey veil over the whole page in Quartz. Anything exporting to PDF
embeds [`illustrations/malha-1280x720-print.svg`](illustrations/malha-1280x720-print.svg), the flattened mesh.

## 9. What this skill decided

Four disagreements between current files were resolved rather than left open. If Isadora wants
otherwise, change it here and the rest follows.

| Question | Ruling |
|---|---|
| Grey is `#e9e9e8` or `#f2f2f2` | Both, one per dialect (§7). They differ by four values out of 255. Never introduce a third |
| Muted text 72% or 50% | Both, one per dialect (§7) |
| Space Grotesk as display | Website only, and only the hero and closing CTA |
| Space Grotesk tracking | +1px everywhere. The R2 deck template's `.14em` is drift, fix it on the next edit |
| A chip on a graphite ground | The site ships none. Fill it `accent/cyan` with graphite ink, or drop the fill for a bare label in muted cyan. Pick one per product |
| A cyan diagram with forty cyan strokes | One highlight. The rule counts elements, not objects |
| Switzer is unavailable in Google Slides | HTML plus PDF stays the default. Slides is only for a deck someone edits live, and then the stand-in is Public Sans, stated in the handoff (§7 of `deck.md`). Inter is the obvious stand-in and the gate bans it, so §10 carries the open question |

## 10. What only Isadora can decide

- **Which contact details are real.** The business card says `contact@fator.ai` and
  `+55 11 99122-2055`; the live site footer says `contato@fator.ai` and a different number. One is
  wrong, and cards are about to be printed.
- **The og-image size.** The artboards and the live meta tags are 1040 x 560; the platform standard
  is 1200 x 630. Recomposing changes the meta tags too.
- **Whether the false ownership copy gets rewritten in the existing decks**, or only avoided in new
  ones (§6).
- **Which face stands in for Switzer in Google Slides.** Switzer ships from Fontshare and the Slides
  picker only reaches Google Fonts, so a Slides deck cannot set the brand face at all. Inter is the
  nearest neutral and `scripts/brand-check.sh` bans it by name. `deck.md` §7 proposes Public Sans as
  the stand-in. Either confirm it, name a different face, or lift the Inter ban for Slides only.

## 11. Sources

- Figma `5NeLWpK0hvQIZqDHnt03LJ` ("Fator AI"): brand guide `🎯 Marca` `723:357`, exports
  `📦 Exportáveis` `740:2`, five deck pages, `🎨 Social Media` `304:182`, `Business Card`
  `1044:1655`, `💡 Cover` `0:1`, variable collection `Brand`, text styles `Deck/*` and `LP/*`. Full
  node map in [`references/figma.md`](references/figma.md).
- Code: `github.com/blockful/fator.ai.lp` (`src/styles/tokens.css`, `src/styles/base.css`,
  `src/components/`). The repo's own `CLAUDE.md` token table is stale; `tokens.css` wins and is
  copied verbatim into `colors/tokens.css` here.
- Drive "Fator AI Assets": logo SVG and PNG, LinkedIn covers, e-mail signature, this guide as PDF,
  fonts with source links.
- Fonts: Switzer (Fontshare, free), Space Grotesk (Google Fonts, SIL OFL).
