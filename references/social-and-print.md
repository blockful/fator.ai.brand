# Social, covers and print

Measured from the Figma pages `🎨 Social Media` (`304:182`), `Business Card` (`1044:1655`),
`💡 Cover` (`0:1`) and the og-image artboard on the landing-page page. Read `../SKILL.md` §2-§4 first.

For the Figma production workflow (task queue, reviewer routing, handoff) use `social-media-design`;
its project file points here for the brand.

## 1. Feed posts and carousels

| | |
|---|---|
| Canvas | **800 x 1000** (4:5) for feed and carousel. 800 x 800 square is reserved but unused. 1529 x 800 for landscape |
| Padding | 48px on posts, 40px on the landscape templates |
| Logo | lockup 170 x 44 on posts, 202 x 52 on the landscape templates |
| Headline | Switzer Regular **72 to 80**, line-height 1.12. One headline per slide |
| Label | Space Grotesk Medium uppercase, +1px, bracketed: `[NÍVEL 1]` |
| Radius | 0 on every social piece |
| Borders | 1px on posts, 2px on a framed chart or diagram |
| Imagery | No photos. Line-art motifs only |

**Carousel rhythm:** slide 1 paper or grey, slide 2 cyan, slide 3 graphite. Pagination lives on
slide 2 as five 12px squares. One highlight per slide: on graphite it is a single `#bcf7fd` span
inside the headline; on a cyan slide the ground itself is the highlight.

**The motif set** (pick one per post, never two): a 35 or 40px square grid in 1px lines, a diagonal
hatch, concentric arcs with 12px base squares, the logo swoosh in thin outline bleeding off a corner,
an 8 x 8 corner square with a hairline rule. A 40px arrow may sit top-right.

The two landscape templates still set their headlines in Gambarino 100 and 88. They are legacy;
the three current posts use Switzer. Never clone the Gambarino ones.

## 2. LinkedIn covers

| | Company | Person |
|---|---|---|
| Canvas | 1128 x 192 safe area | 772 x 192 safe area |
| Logo | light lockup 109 x 28, top-right | light lockup 93 x 24, top-right |
| Field | dot-matrix halftone bleeding off the left edge | same, tighter crop |
| Tagline | two lines, right-aligned bottom-right, `#bcf7fd` | same |

Ground is graphite. The tagline in the file is set in Gambarino; **set it in Switzer** and keep the
line break manual so no word is stranded. The older paper-and-grid covers clip their tagline behind
the logo block: do not clone them.

## 3. Business card

- **90 x 50 mm trimmed, 96 x 56 mm with 3 mm bleed.** At 300 dpi that is 1063 x 591 on a
  1134 x 661 artboard; the 35px inset in Figma is the 3mm bleed. Keep type at least 4mm from trim.
- **Only two colours: graphite `#202125` and cyan `#bcf7fd`.** Paper is not used on the card. Radius
  0, no borders, no shadow.
- **Front, current:** cyan flood with the icon-only mark in graphite at 44mm, flush left at the 3mm
  margin. Nothing else.
- **Front, expressive alternative:** graphite with the halftone spark bleeding off the left at 52%
  opacity, an uppercase Space Grotesk tagline at about 9pt top-centre, and the lockup at 55mm
  bottom-right.
- **Back:** graphite, lockup 30 x 7.8mm at the 3mm margin top-left, then a contact stack in Space
  Grotesk uppercase at about 6.7pt, line-height 1.32, `#bcf7fd`, 28px gaps: phone, e-mail, site,
  address on two lines.
- Space Grotesk carries the whole card. This is the one medium where it sets everything, because
  there is no reading copy on a card, only labels.

**Before any print run, confirm the contact details.** The cards say `contact@fator.ai` and
`+55 11 99122-2055`; the live site footer says `contato@fator.ai` and a different number. One of
them is wrong and only Isadora can say which.

## 4. Covers, og-images and any wide brand surface

One recipe covers the file cover, the og-image and any wide title card:

1. Graphite ground.
2. A 40px cyan graph-paper grid in 1px `#bcf7fd`, bleeding past both edges.
3. A centred knockout panel filled graphite with a 1px cyan border.
4. The cyan lockup centred inside the panel.

The existing artboards are **1040 x 560**, and the live site declares that size to Open Graph.
The platform standard is **1200 x 630**: recompose at 30 x 15.75 cells rather than scaling the
artboard, and flag the change so the meta tags are updated in the same pass.

## 5. Other print

- Same palette, converted to CMYK by the printer. Paper `#fafaf8` is the stock; leave it unprinted
  and let the graphite and cyan do the work.
- Respect the logo minimums: symbol 24px tall, lockup 96px wide, clear space half the symbol height.
- One cyan element per piece. On a folder or a banner, that is usually the logo itself.
- Roll-ups and signage: the grid mesh and the halftone field both scale; the 24px lattice does not,
  it turns into moiré. Use the mesh.
