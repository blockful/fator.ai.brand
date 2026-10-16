# The screen dialect: web and product UI

Source of truth: `github.com/blockful/fator.ai`, the v2 landing page rebuilt on Sep 1 2026 **for**
the Aug 2026 brand refresh. It is the newest brand artifact, so for anything on a screen it beats
both the brand-guide frames and the Figma LP wireframe (page `👩‍💻 Landing Page` still holds the May
2026 wireframe with Gambarino, IBM Plex Mono, `#e6ecf0` and `#a4f5ff`: never copy from it).

Read `../SKILL.md` §2-§4 first for the invariants. This file is only the screen-specific grammar.

## 1. What makes a Fator screen look like Fator

1. **A 1px hairline grammar, not boxes.** Content sits inside a centred column with a 1px rule on
   each side; every divider, header and row separator is another 1px rule. Cards are the exception,
   not the rule.
2. **Bands.** The page is a vertical stack of full-bleed bands, each either paper or graphite, each
   declaring its own theme. Elements read the band to pick their palette.
3. **Space Grotesk labels everywhere, uppercase, tracked.** Eyebrows, buttons, table headers, form
   labels, meta keys, index numbers.
4. **One accent, two shades.** `#bcf7fd` on graphite, `#1ac3d8` on paper. Never mixed on one ground.
5. **Restraint in shape.** Radius 2px for controls, 4px for chips and image crops. Nothing decorative.

## 2. Layout skeleton

```css
:root { --page-max:1440px; --page-gutter:40px; --section-pad:40px; --grid-rule:1px; --navbar-height:72px; }
@media (max-width:720px){ :root{ --page-gutter:20px; --section-pad:20px; } }

.band        { width:100%; background:var(--bg-page); color:var(--text-inverted); }
.band--dark  { background:var(--bg-dark);  color:var(--text-primary); }
.band__inner { position:relative; margin:0 auto;
               width:min(calc(var(--page-max) - 2*var(--page-gutter)), calc(100% - 2*var(--page-gutter)));
               border-left:var(--grid-rule) solid var(--border-grey);
               border-right:var(--grid-rule) solid var(--border-grey); }
.band--dark .band__inner { border-color:var(--border-dark-blue); }
```

- Desktop content column is **1360px**; inner padding of 40px leaves a 1280px text column.
- Every band carries `data-section-theme="light|dark"` so the navbar can invert against it.
- Between bands, a **spacer strip**: an empty light band 100px tall (56px at ≤720px) with a 1px rule
  top and bottom. It closes the band above and opens the one below without inventing a margin.
- Section header recipe: `padding:60px var(--section-pad)`, `border-bottom:1px` rule, flex column,
  `align-items:flex-start`, `gap:16px`, children in order eyebrow chip, `h2`, optional lead paragraph.
- Rows and list items divide with `border-bottom:1px`; the last child drops it so it does not double
  with the next band rule.
- Breakpoints: **900** (everything stacks), **720** (gutters 40 to 20), **640** (nav gap), **520**
  (hamburger). Desktop-first, no min-width queries. Do not invent new ones.

## 3. Type on screen

Eleven primitives, one per Figma `LP/*` style. Never set a family, size or weight outside them.

| Class | Family | Weight | Size | Line-height | Case | Use |
|---|---|---|---|---|---|---|
| `.type-display` | Space Grotesk | 400 | `clamp(34px,2.15rem+1.7vw,56px)` | 1.12 | UPPER, -1px | Page hero headline |
| `.type-display-2` | Space Grotesk | 400 | `clamp(28px,1.6rem+.95vw,40px)` | 1.12 | UPPER | Secondary hero, closing CTA |
| `.type-title` | Switzer | 400 | same as display | 1.12 | sentence | Every section `h2`, page `h1` (`text-wrap:balance`) |
| `.type-statement` | Switzer | 400 | `clamp(28px,1.6rem+.95vw,40px)` | 1.2, -0.5px | sentence | Manifesto statements |
| `.type-card-title` | Switzer | 400 | 22px | 1.2 | sentence | Card and row titles |
| `.type-description` | Switzer | 400 | 18px | 1.45 | sentence | Section leads |
| `.type-body` | Switzer | 400 | 16px | 1.5 | sentence | Body copy |
| `.type-caption` | Switzer | 400 | 14px | 1.52 | sentence | Captions, legal, meta values |
| `.type-mono` | Space Grotesk | 500 | 14px | 1.2, +1px | UPPER | Nav, buttons, chips, table heads, tabs |
| `.type-mono-label` | Space Grotesk | 500 | 12px | 1.2, +1px | UPPER | Form labels, meta keys, index numbers, zone labels |
| `.type-link` | Switzer | 500 | 16px | 1.45 | sentence | Emphasised inline link |

**Space Grotesk as display is deliberate on screen.** The hero and the closing CTA set their
headline in Space Grotesk 400 uppercase; that decision is 13 days newer than the brand guide's
"labels only" line. It stays **inside the screen dialect**: a deck, a document or a print piece
titles in Switzer. Everywhere else on screen, Space Grotesk is still labels only.

Source labels are written lowercase in the markup and uppercased by CSS, so the copy stays readable
in code review.

## 4. Components

### Button
```css
.btn { display:inline-flex; align-items:center; justify-content:center; gap:8px;
       padding:12px 20px; border:1px solid transparent; border-radius:2px; white-space:nowrap;
       transition:background-color 180ms var(--ease-out-soft), color 180ms var(--ease-out-soft),
                  border-color 180ms var(--ease-out-soft); }   /* label = .type-mono */
```

| Variant | On graphite: rest / hover | On paper: rest / hover |
|---|---|---|
| `outline` (the primary in practice) | border and text `#bcf7fd`, no fill / fill `#bcf7fd`, text `#202125` | border and text `#202125` / fill and border `#bcf7fd`, text `#202125` |
| `solid` | fill and border `#bcf7fd`, text `#202125` / no fill, text `#bcf7fd` | same rest / text and border `#1ac3d8`, no fill |

Hover choreography, the site's signature: an 8px `currentColor` square grows in on the left
(`transform:scale(0)` and `margin-left:-16px` to `scale(1)` and `0`, 240ms) while the label rolls
down and a duplicate drops in from above (300ms). `:focus-visible` mirrors hover. Disabled is
`opacity:.6`.

### Chips and labels
- **Eyebrow chip:** `padding:4px 8px; border-radius:4px; background:var(--bg-muted); color:var(--text-inverted)`,
  `.type-mono`, `width:fit-content`, 16px above the `h2`. The site ships it on paper bands only and
  has no graphite counterpart, so this skill rules one: on graphite, either fill it
  `var(--accent-cyan)` with graphite ink, or drop the fill and set a bare `.type-mono` label in
  `--text-accent-muted`. Pick one per product and keep it.
- **Selectable chip:** `width:148px; padding:10px; border:1px solid var(--border-dark); border-radius:2px;
  background:var(--bg-page); opacity:.32` and, when active, `background:var(--accent-cyan); opacity:1` (360ms).
- **Status chip:** `padding:3px 10px; border-radius:999px; background:var(--bg-wash-cyan);
  border:1px solid var(--accent-cyan-dark); color:var(--text-accent-dark)`, Space Grotesk 13px. The
  one place a pill radius is allowed, because it reads as data, not as a button.
- **Live dot:** 7px `--accent-cyan-dark` circle plus a 12px uppercase label, pulsing 1.6s from 1 to .3.

### Surfaces
| Surface | Spec |
|---|---|
| Row pill (integration, tool) | `flex; gap:10px; padding:10px 14px; background:var(--bg-page); border:1px solid var(--border-grey); border-radius:4px`, 20px icon plus 12px uppercase label |
| Muted panel (diagram, art) | `background:var(--bg-muted)`, edged by a 1px rule, `padding:40px` to `56px 40px` |
| Product window (a UI shown inside the page) | `width:min(460px,100%); background:var(--bg-page); border:1px solid var(--border-grey); border-radius:6px; overflow:hidden`, title bar `padding:12px 16px` with a bottom rule, three 9px grey dots, a 12px uppercase title and a live dot on the right |
| Elevated card | `padding:20px 22px; border:1px solid var(--border-grey); border-radius:8px` |
| Dark box | `border:1px solid var(--border-dark-blue); background:var(--bg-dark)`, inner columns split by the same rule, `padding:40px` |
| Photo tile | `border-radius:4px; overflow:hidden`, `img{object-fit:cover; filter:grayscale(1)}` |

Two exceptions to the flat rule live on screen and only on screen: the elevated card and the product
window carry `box-shadow:0 20px 44px -18px rgba(32,33,37,.3)` and a radius of 6 to 8px, because they
depict a floating UI. **Do not copy that shadow onto a content card, a deck slide or a print piece.**
Everything else on screen is flat.

### Label and value row (the pattern to reuse for any data)
```css
.row  { display:flex; justify-content:space-between; gap:24px; padding:11px 0;
        border-bottom:1px solid var(--border-grey); }
.row .k { font:400 14px/1.5 var(--font-body); color:var(--text-muted); }
.row .v { font:500 13px/1.2 var(--font-mono); color:var(--text-inverted); text-align:right;
          letter-spacing:var(--ls-mono); }
```
Definition-list variant: rows `padding:12px 0` with a **top** rule, key `.type-mono-label` at a fixed
`width:96px`, value `.type-caption`. Numbers are PT-BR formatted: `1.284`, `R$ 0,42`, `98,4%`, `24/7`.
Index numbers read `01`, `02` in `.type-mono-label` and `--text-accent-dark`.

### Form fields
```css
.field { display:flex; flex-direction:column; gap:8px; }
.field label { font:500 12px/1.2 var(--font-mono); letter-spacing:1px; text-transform:uppercase;
               color:var(--text-muted); }                     /* dark band: --text-accent-muted */
.field input, .field textarea, .field select {
  font:400 16px/1.5 var(--font-body); color:var(--text-inverted); background:transparent;
  border:1px solid var(--border-grey); border-radius:2px; padding:12px 14px;
  transition:border-color 180ms var(--ease-out-soft); }
.field :focus-visible { outline:none; border-color:var(--accent-cyan-dark); }  /* dark: --accent-cyan */
.field textarea { resize:vertical; min-height:140px; }
.form-row { display:grid; grid-template-columns:1fr 1fr; gap:24px; }  /* 1fr at ≤900px */
form { display:flex; flex-direction:column; gap:24px; }
```
On graphite swap ink to `--text-primary` and borders to `--border-dark-blue`. A select gets
`appearance:none`, `padding-right:38px` and a 12x8 chevron as a background SVG in the band's accent.
The form column is separated from its intro by a full-height 1px rule, never boxed in a card. Errors
are Switzer 14px in `#c0392b` on paper, `#ff9a9a` on graphite, with `role="alert"`. Success is a
40px check in `--accent-cyan-dark`, a 22px Switzer heading and one muted line.

### Navigation, tabs, accordion, rows
- **Navbar:** fixed, 72px, inner width equal to the rails column, `justify-content:space-between`,
  1px bottom rule. It reads the theme of the band under y=36px and inverts in 220ms. Links are
  `.type-mono` with a 1px underline that draws in from the left over 260ms. Past 64px of scroll it
  goes compact: the wordmark fades and slides out, the mark stays.
- **Underline tabs:** `gap:32px`, bottom rule; tab `.type-mono`, `padding-bottom:14px`, muted, active
  in `--text-inverted` with a 2px `--accent-cyan-dark` underline. Panels enter with y 10 to 0 in 360ms.
- **Full-width tabs:** `flex:1; padding:18px 16px; text-align:center`, Switzer 16px, muted, separated
  by 1px rules; hover and active wash `--bg-wash-cyan`, active ink `--text-accent-dark` plus a 2px
  bottom bar. When they auto-rotate, the bar fills over 6000ms linear and doubles as the countdown.
- **Accordion:** row `padding:32px 40px` with a bottom rule; question Switzer 20px; a 24px CSS plus
  that becomes a minus when open (300ms); the answer opens with `grid-template-rows:0fr` to `1fr`
  plus opacity over 380ms, body 16px muted, `max-width:930px`.
- **Selectable list row:** `padding:28px 40px; border-bottom:1px; border-left:2px solid transparent`;
  hover or active adds `background:var(--bg-wash-cyan)` and `border-left-color:var(--accent-cyan-dark)`;
  title 22px going cyan, body 16px going from muted to full ink.
- **Collapsible text, everywhere:** `display:grid; grid-template-rows:0fr; opacity:0` to `1fr; 1` in
  380 to 480ms, with `overflow:hidden` on the child. Never animate height.

### Links, bullets, ribbon, footer
- Text link: inherits colour, no rest underline, a 1px `currentColor` bar draws in from the left in
  260ms at `bottom:-4px`. Inline prose links may underline with `text-underline-offset:3px` in cyan.
- Arrow CTA: `.type-mono` in the band accent plus an 18px chevron that shifts 6px right on hover.
- Bullets: a 7px `--accent-cyan-dark` **square** at `left:0; top:7px`, `padding-left:18px`. Ordered
  lists put the `::marker` in Space Grotesk cyan. Never a round bullet, never a text glyph.
- Ribbon CTA (a full-width band-closing link): `padding:32px 40px`, top rule, centred `.type-mono` in
  cyan over a washed cyan gradient; on hover a `#bcf7fd` field sweeps in from the right in 650ms and
  the ink turns graphite. The one sanctioned gradient on the site.
- Footer (graphite): `padding:80px 40px 40px`, top rule, a 34% brand column with the logo at 35px in
  `--accent-cyan`, three link columns (head `.type-mono` muted, links `.type-body` cyan), then a legal
  row separated by another rule with the copyright at `opacity:.7` and 16px social glyphs.

## 5. Motion

| Intent | Duration and easing |
|---|---|
| Colour, border, ink | 180ms `--ease-out-soft` |
| Navbar theme swap | 220ms |
| Button square and label roll | 240ms and 300ms |
| Active-state swap | 360ms |
| Collapsible open and close | 380 to 480ms |
| Panel entrance | 360 to 480ms, y 10 to 14px |
| Scroll reveal (site-wide) | `opacity 0` and `y:24` to `0`, 0.7s `power3.out`, stagger 0.08s, fires once at `top 88%` |
| Hero and section entrances | 0.7 to 1.1s `power3.out`, staggered 0.1 to 0.14s |
| Auto-rotation | 6000ms with a 2px linear progress bar, starts at 30% visibility, resets on click |
| Pulses and sweeps | 650ms to 1.8s `--ease-in-out` |

Tokens: `--ease-out-soft: cubic-bezier(.22,1,.36,1)` for interface work, `--ease-in-out:
cubic-bezier(.65,0,.35,1)` for travel and pulses. Reveals use GSAP on the site; plain CSS
transitions are fine in a smaller product. Honour `prefers-reduced-motion` by rendering final states.

## 6. Product and dashboard UI (the platform design system)

The landing page is marketing; a product screen is denser. Keep the grammar, change the density.

- **Ground:** paper. Graphite is for the top bar, the empty state illustration area and marketing
  surfaces inside the product. A dashboard on a graphite ground reads as a slide, not a tool.
- **Structure:** the same 1px rules. A table is rows with bottom rules, a header row with a heavier
  bottom rule, no vertical rules, no zebra striping, no card per row.
- **Density:** row height 44 to 48px, cell padding `11px 16px`, section padding 24 to 32px instead of
  the marketing 60 to 80px. Keep the 8px spacing rhythm.
- **Cards:** only when a group must float above the page. 1px `--border-grey`, radius 3 to 4px, no
  shadow. The shadowed elevated card from the LP is a marketing device.
- **Type:** Switzer 14px for content, 16px for anything read as prose, `.type-card-title` 22px for
  panel titles; Space Grotesk 12px uppercase for column headers, statuses, meta keys and index
  numbers; values in Space Grotesk 13px right-aligned when they are numbers.
- **Accent budget:** `#1ac3d8` for the one primary action, the selected row or tab, links, data
  strokes and the focus ring. `#bcf7fd` fills only a chip, a selected cell or a highlighted total.
  `--bg-wash-cyan` `#ecf9f9` is the selected-row wash. A screen with cyan in six places has no accent.
- **State colours:** the brand ships none beyond cyan. Use graphite plus the wash for neutral and
  selected, and reserve red only for destructive and error (`#c0392b` on paper, `#ff9a9a` on
  graphite, the values the site already uses). Never introduce green, amber or purple without asking.
- **Icons:** Material Symbols Outlined, the site's set, at 16, 18 or 24px, `currentColor`. Never a
  text glyph as an icon, never a second icon family, never an emoji.
- **Charts:** graphite for the primary series, `#1ac3d8` for the highlighted one, `#a9dde2` and
  `#ecf9f9` for supporting fills, 1px axes in `--border-grey`, no gridlines beyond the baseline, no
  gradient fills, labels in Space Grotesk 12px uppercase. Cite the source under the chart in
  `.type-source`. Load the `dataviz` skill for the chart-form decision, then map its palette to these.
- **Empty, loading, error:** a 12px uppercase label, one Switzer 16px sentence, and at most one
  outline button. No illustration.
