# The deck dialect: slides

Measured from every slide of the five commercial decks in Figma `5NeLWpK0hvQIZqDHnt03LJ` (pages
`👁️ Deck`, `Deck: Versão Curta`, `Deck - Solução para cliente`, `Deck - Parceiros`, `R2 Deck`) and
from the brand-guide frame `6 · Padrões`. Read `../SKILL.md` §2-§4 first.

For the HTML mechanics (stage fit, per-slide auto-shrink, PDF export, verification) use
`html-presentation`. For the sales-copy gates and the R2 interactive deck use
`fator-html-presentation`. This file is the visual grammar both of them assume.

## 1. The frame that never changes

| | |
|---|---|
| Stage | **1280 x 720** |
| Margins | 40px on all four sides. Content box x 40 to 1240 (1200 wide), y 45 to 676 |
| Section chip | top-left at x 40, y 45, height 28 |
| Logo, inner slides | 108 x 28 at x 1132, y 45 (top-right) |
| Logo, cover and closing | 232 x 60 at x 40, y 45 (top-left, and it grows) |
| Title | left-aligned at x 40, top at y 127. Never centred |
| Optional subtitle | y 210, Switzer Regular 18 / 1.4, muted |
| Main content band | y 329 to 676, or a right column from y 127 to 676 |
| Three-column grid | 392px columns with 12px gutters (392 x 3 + 12 x 2 = 1200) |
| Two-column split | left content to x 632, right module x 749 w 491; or right module x 548 w 690 |
| Grid texture | graphite slides only: cover at 16% opacity, closing at 12%. Never on a paper slide |

## 2. Grounds and the highlight

Four grounds, in this order of frequency: paper `#fafaf8`, grey `#e9e9e8`, cyan `#bcf7fd`
full-bleed, graphite `#202125` (cover and closing).

- **One highlight per slide.** The highlight is one *element*, not one coloured object: a cyan card
  in a row of three, a graphite block at the top of a ladder, a cyan row in a list. A diagram whose
  strokes and labels are all `#1ac3d8` counts as one element, not as forty.
- **When the whole slide is cyan, the slide is the highlight.** Do not then add a cyan card. Invert
  something to graphite instead, which is what the ladder slide does with its top step.
- Chip fill follows the ground: `#e9e9e8` on paper, `#a9dde2` on cyan, `#bcf7fd` on graphite. The
  decks also contain `rgba(32,33,37,.10)` and `rgba(28,29,31,.08)` chip tints: that is drift, use
  the solid values.
- The deck grey is `#e9e9e8`; the code grey is `#f2f2f2`. They differ by four values out of 255 and
  nobody will ever see it. Use the one that matches your medium and never introduce a third.

## 3. Type on a slide

| Role | Font | Size / line-height | Where |
|---|---|---|---|
| Cover and closing claim | Switzer **Medium** | 88 / 1.12 | Only these two slides |
| Statement | Switzer Regular | 68 / 1.2 | A slide that is one sentence |
| Title | Switzer Regular | 52 / 1.2 | Every other slide |
| Closing question | Switzer Regular | 36 / 1.2 | The line under the closing rule |
| Statistic number | Switzer Regular | 72 / 1.0 | Stat cards |
| Statistic legend | Switzer Medium | 18 / 1.2 | Under the number |
| Card and row title | Switzer Regular | 20 to 24 / 1.2 | Cards, list rows, news headlines |
| Body | Switzer Regular | 14 / 1.4 | Card and row copy |
| Chip | Space Grotesk Medium | 14 / 1.12, uppercase, +1px | The section chip |
| Bracket label | Space Grotesk Medium | 13 / 1.2, uppercase | `[nível 5]`, `[1] instruir pessoas`, card labels |
| Diagram label | Space Grotesk Medium | 20 / 1.12, uppercase, +1px | Large labels inside a diagram (`PRESENTE`, `FUTURO`) |
| Contact on closing | Space Grotesk Medium | 20 / 1.4, uppercase | Top-right of the closing slide |
| Data source | Switzer Medium | 12 / 1.2, uppercase, `text/muted` | Under any number |
| Press source | Switzer Regular | 14 / 1.2 at 60% | `Fonte: Exame` under a news headline |

Switzer Medium 88 on the cover and closing is the only place the display weight goes up. Everything
else titles in Regular.

## 4. The devices

| Device | Spec |
|---|---|
| Card | 2px `#202125` border, radius 3, padding 20, inner gap 20. Fill `#bcf7fd` when it is the highlight, otherwise no fill so the ground shows through |
| Stat card | Card, contents top to bottom: bracket label, number 72/1.0, legend Medium 18, body 14 (flex 1), source 12 uppercase at 50% |
| Bordered stat (inline, no card) | `border-left: 2px #202125`, `padding-left: 20`, `padding-y: 8`, value Switzer Regular 32 to 40 / 1.0, label Switzer Medium 16 / 1.2 at 75% |
| Row with tile | Card, flex row, gap 16, padding 16: a 116 x 140 or 96px square icon tile filled `rgba(32,33,37,.06)` radius 2, then a column with title 20, body 14, source |
| Icon tile | Square or 116 x 140, fill graphite at 6%, radius 2, glyph drawn in 2px `#202125` strokes at 36 to 44px |
| Photo | 386 to 390 x 240, radius 3, `object-fit: cover`, caption Space Grotesk 12 uppercase centred at 40%, gap 6. Real photos only |
| News row | Photo 188 x 145 radius 3 with an inner 2px border and four 8px corner squares, then headline 18 and `Fonte:` line, rows divided by 2px rules |
| Connector | 2px `#202125` line ending in a 12px square that lands on the target's border. Label sits on the line in a `#fafaf8` chip, Space Grotesk 13 uppercase, `[n] nome` |
| Ruler | 1200 x 2px rule with an 8 x 8 square at each end, at y 360 on the cover |
| Cell mesh | 14px squares, 2px borders, overlapping 2px, rows of decreasing length to show volume |
| Lattice | A 24px module of 2px lines used as a slide-wide ground for the ladder, with blocks masking it |
| Quote | 40px round avatar, name Switzer Medium 12 uppercase, role muted beneath |
| Arc ornament | Concentric semicircles, the first in 2px `#202125` and the rest 1px at 12%, with 12px square markers on the baseline at a 169.7px pitch |

## 5. Slide archetypes

Each of these exists in the real decks; clone the nearest one instead of inventing a layout.

1. **Cover.** Graphite, grid at 16%, logo 232 x 60 top-left, a bracketed tag top-right in Space
   Grotesk 16 uppercase, the 1200 x 2px rule with end squares at y 360, claim in Switzer Medium 88
   at the bottom left (y 494). No cyan.
2. **Statement.** One sentence at 68px, bottom-anchored, over a full-bleed cyan ground with an arc
   ornament above. The chip reads the section, not the sentence.
3. **Title plus diagram column.** Title 52 at y 127 on the left with an inline bordered stat under
   it; a full-height right column starting at x 750 with a 2px left border holding the diagram. The
   diagram is drawn in `#1ac3d8` on paper, with a `#bcf7fd` field at 16% and a hatch of 1px cyan
   diagonals for the "after" half.
4. **Three cards.** Title 52, then three 392px cards at y 329, height 347, gutter 12. The card that
   is the argument is filled cyan. Used for stats, offers, proof points, next steps.
5. **News cards.** A 592px hero card on the left (image, headline 24, source) and three 491px
   thumbnail rows on the right divided by 2px rules.
6. **Paths or options.** A boxed title on the left (392 x 246, 2px border, radius 3, padding 28,
   title 52 inside), a bracket connector fanning right to three option rows, the recommended one
   filled cyan.
7. **Ladder.** A 24px lattice ground, five blocks bottom-aligned, each 52px taller than the last,
   the top one inverted to graphite. Labels `[nível 1]` to `[nível 5]`, title Switzer Medium 20,
   body 14.
8. **About us.** A long statement, two photos with uppercase captions, and three inline bordered
   stats along the bottom.
9. **Quote or social proof.** A photo on the left, one or two quote blocks on the right with the
   avatar, name and role.
10. **Process rows.** Three bordered rows, each with an icon tile, a title and a body, plus an
    isometric illustration and one anchored stat.
11. **Portfolio.** Three cards, the first filled cyan, each with a label, a title and a result line.
12. **Demo flow.** A task card, an agent chip in graphite, and a wall of output tiles in cyan.
13. **Dashboard mock.** A graphite panel on a paper slide, with a header row, label and value rows
    and a sparkline of cyan bars. This is the only place a slide shows a product UI.
14. **Roadmap.** A horizontal timeline on a cyan ground with five square markers on a 2px axis.
15. **Pricing.** Three or four cards on the grey ground, one filled cyan and carrying a small
    graphite recommendation tag above its top edge.
16. **Closing.** Graphite, grid at 12%, logo 232 x 60 top-left, contact top-right in Space Grotesk
    20 uppercase, then a column at y 358 with gap 40: claim Switzer Medium 88, the 1200 x 2px rule,
    and one question in Switzer Regular 36. One statement, one ask, one contact.

Rhythm: the decks open graphite, alternate paper and grey through the middle with one cyan slide per
act, and close graphite. Never place two cyan slides side by side.

## 6. What is already in the file, and what to avoid there

Reusable: the `Base grid` texture instance (the golden-cannon construction, 28 hairlines in
`#FAFAF8` at 50% stroke, on graphite only) is exported for HTML as
`../illustrations/malha-1280x720.svg`. **For anything that exports to PDF, embed
`../illustrations/malha-1280x720-print.svg` instead**: the raw export's group opacity becomes a soft
mask in the PDF and Quartz (Preview, QuickLook, WhatsApp previews on Apple) renders it as a grey
veil over the whole page. The print version is the same mesh flattened onto an opaque graphite
rect.

Do not use:

- The `Deck/Logo — Light` and `Deck/Logo — Dark` components (`349:11`, `349:21`). They still carry
  the May 2026 palette (`#1AC3D8` mark, `#E6ECF0` wordmark, `#0A1C1E` dark) and no slide instances
  them. Use `../logo/fator-logo.svg` or the flattened vector the slides carry.
- The `Deck/Grid Texture` component (`393:84`): an orphan 120px grid at 5%, not what any slide uses.
- The hidden rule-of-thirds layer inside `Base grid`: its lines are `#3146FF`, off-palette. Keep it
  hidden or delete it.
- The OpenAI-lookalike glyph inside one icon tile on the paths slide. Third-party marks belong in a
  partner logo tile, drawn from the vendor's own asset, not hand-redrawn into brand line art.

Known drift in the files, worth not copying: the in-slide logo vectors fill `#1C1D1F` and some
titles `#1c1d1f` instead of `#202125`; two decks put the logo bottom-left at 188 x 49 on one slide;
badge y is 44 on one slide and 45 everywhere else; card radius is 4 on the short deck and 3 in the
main one. Use 3, use `#202125`, use y 45.

## 7. Google Slides

Google Slides cannot render the brand's primary typeface. **Switzer ships from Fontshare, and the
Slides font picker only reaches the Google Fonts catalogue**, which does not carry it. Space Grotesk
is on Google Fonts, so labels are safe; body and titles are not.

So route by who edits the deck:

- **Nobody outside the loop edits it** (client deck, pitch, anything sent as a file): build it in
  HTML from [`../templates/deck.html`](../templates/deck.html) and export PDF. This is the default.
  Do not move a finished deck into Slides to "make it shareable".
- **Someone has to edit it live**, in a meeting or across the team: Slides is fine, with the
  substitution below stated in the handoff so nobody thinks the fallback is the brand.

### The substitution

| Brand | In Google Slides | Why |
|---|---|---|
| Switzer 400 / 500 | **Public Sans** Regular / Medium | Nearest neutral neo-grotesque in the Google Fonts catalogue with a comparable x-height. Inter is the obvious choice and `scripts/brand-check.sh` bans it, so it is not used here. See SKILL.md §10: this one is Isadora's to confirm |
| Space Grotesk 500 uppercase | Space Grotesk Medium uppercase | On Google Fonts, so it is the real face |
| Gambarino | never appears | It only ever lives inside the logo, which is placed as an image |

Never substitute with a display or serif face to "add character". The character in this brand comes
from colour, rule weight and the device repertoire, all of which Slides reproduces exactly.

### Sizes: multiply by 0.75

Slides measures in points on a 960 x 540pt stage; this guide measures in pixels on 1280 x 720. The
stage is the same 16:9, so every size in §3 converts by **0.75**.

| Style | Deck px | Slides pt |
|---|---|---|
| Capa | 88 | 66 |
| Declaração | 68 | 51 |
| Título | 52 | 39 |
| Stat número | 72 | 54 |
| Card título | 20 | 15 |
| Corpo | 14 | 10.5 |
| Badge / rótulo | 14 / 13 | 10.5 / 10 |
| Fonte | 12 | 9 |

Margin 40px becomes 30pt. Card padding 20px becomes 15pt.

### What Slides gets wrong unless you correct it

- **Corners.** Slides has no numeric corner radius, only a drag handle, so a rounded rectangle
  cannot be set to 3px. **Use square rectangles.** A square corner is on brand; an eyeballed 8px
  one is not.
- **Line weight.** 2px rules become 1.5pt and 1px rules become 0.75pt. If the picker refuses a
  fractional weight, take 2pt and 1pt and accept the slightly heavier rule. Never go above 2pt.
- **Bullets.** The default is a disc. Change it to a square, or drop the list and draw 7px cyan
  squares as shapes.
- **Shadows.** Check that drop shadow is off on every shape and image. Slides turns it on for some
  inserted objects.
- **Theme.** Set the page background per slide from the ramp. Do not let the Slides theme supply a
  colour, and delete the default theme's placeholder fonts so a collaborator does not inherit them.
- **Logo.** Place [`../logo/fator-logo.svg`](../logo/fator-logo.svg) as an image, not as text.
  Slides will not resolve `currentColor`, so export one graphite copy and one paper copy and use
  the right one for the ground.

Mechanics for driving Slides through the API live in the `slides` skill. Brand truth stays here.
