# Fator Design System

The basic design system for the Fator platform, built so that after the first
delivery the platform team has autonomy on later iterations without waiting on
design. Task: [Create a basic Fator design system](https://app.clickup.com/t/86akezpjh).

It lives in two places that must stay in step:

| Where | What |
|---|---|
| Figma, file `5NeLWpK0hvQIZqDHnt03LJ`, page [💠Design System](https://www.figma.com/design/5NeLWpK0hvQIZqDHnt03LJ/?node-id=1099-402) | variables, text styles, components |
| This folder (`ui/` in the brand repo) | `tokens.css`, `theme.css`, and the specs below |

The visual rules it obeys come from this repo's [`SKILL.md`](../SKILL.md),
section 7 (screen dialect) and [`references/web-ui.md`](../references/web-ui.md)
section 6 (product and dashboard UI).

**The reference application is the v3 screen set** (Isadora's ruling, Oct 16
2026): Figma section `Painel do cliente / v3 proposta (Claude)`, node
`1423:426`, holding six desktop screens at 1440 (Login `1448:352`, Visão geral
`1413:261`, Tarefas `1425:411`, Relatórios `1428:549`, Custos `1425:831`,
Acessos `1426:486`) and the same six at 390 for mobile. Where this document and
those screens disagree, the screens win and this document gets fixed; the
specs below were measured from them.

## 1. How the variables are set

Four tiers, the same architecture as Orbit UI, so anyone who has worked in
Anticapture already knows how to read it. Each tier only ever aliases the tier
above it. Nothing binds a raw hex.

| Tier | Collection | Modes | Count | Holds |
|---|---|---|---|---|
| 1 | `Brand` | Default | 23 | raw brand colour, the seven colours plus their documented derivations |
| 2 | `Fator Primitives` | Default | 56 | numeric scales in Tailwind vocabulary: `rounded/*`, `spacing/*`, `size/*`, `text/*`, `leading/*`, `tracking/*`, `stroke/*`, `opacity/*` |
| 3 | `Shadcn/ui` | Light | 36 | the semantic layer shadcn expects: `background`, `foreground`, `card`, `primary`, `muted`, `accent`, `destructive`, `border`, `input`, `ring`, `radius-*`, plus `custom/*` |
| 4 | `Fator / Theme` | 🖥️ Desktop | 114 | application intent: `page/*`, `surfaces/*`, `borders/*`, `text/*`, `icon/*`, `blocks/*`, `components/<name>/*` |

Two deliberate differences from Orbit UI:

- **No Tailwind colour ramp.** Orbit imports all 247 Tailwind colours. Fator
  ships seven colours and bans the rest, so tier 1 is the brand palette itself.
  A green or an amber is not available on purpose. If a status needs a third
  state, ask before inventing one.
- **One mode, not two.** `Shadcn/ui` carries a single `Light` mode because the
  product ground is always paper. A graphite dashboard reads as a slide, not as
  a tool. Dark is one column away when it is actually wanted: add a `Dark` mode
  and only the 36 tokens in tier 3 need values.

### The mapping that matters: two cyans, two jobs

`primary` is **light cyan `#bcf7fd` with graphite ink**. It is a **fill**, so
shadcn's `bg-primary text-primary-foreground` gives the Fator primary button with
no override. It is far too pale to draw a line or set text on paper, so it never
does either.

`accent-strong` is **dark cyan `#1ac3d8`**, and it does all the line work:
strokes, links, the active tab bar, the selected row indicator, data strokes and
the focus ring (`ring` is the same value). Whenever you reach for cyan, ask
whether you are filling or drawing, and pick accordingly.

`accent` is the wash `#ecf9f9` with `accent-foreground` in dark cyan, so shadcn
hover and selected states land on the brand's selected-row wash for free.

The accent budget is unchanged: one cyan element per view. A screen with cyan in
six places has no accent.

## 2. Type

Eleven `UI/*` styles in Figma, eleven `.type-*` classes in `theme.css`. They are
denser than the landing page: 14px is the content default, 16px is for anything
read as prose.

| Style | Family | Size | Use |
|---|---|---|---|
| `UI/Stat` | Switzer 400 | 32 | a single number on a stat card |
| `UI/Page Title` | Switzer 400 | 28 | page h1 |
| `UI/Panel Title` | Switzer 400 | 22 | card and panel titles |
| `UI/Subtitle` | Switzer 400 | 18 | section lead |
| `UI/Body` | Switzer 400 | 16 | prose |
| `UI/Body Small` | Switzer 400 | 14 | the content default |
| `UI/Body Small Medium` | Switzer 500 | 14 | emphasis inside a content line |
| `UI/Caption` | Switzer 400 | 12 | captions, legal, meta values |
| `UI/Value` | Space Grotesk 500 | 13 | numbers, right aligned |
| `UI/Label` | Space Grotesk 500 | 12 | column headers, form labels, statuses, index numbers |
| `UI/Label Large` | Space Grotesk 500 | 14 | buttons, tabs, nav |

Switzer never goes above Medium 500. Space Grotesk is Medium only, uppercase,
tracked +1px. Labels are written lowercase in the source and uppercased by the
style, so the copy stays readable in review.

## 3. Components

Built as Figma components with variants, and specified here so they can be
implemented without opening Figma.

| Component | Variants | Spec |
|---|---|---|
| Button | Variant: Primary, Outline, Ghost, Destructive. Size: Sm, Md, Lg. State: Default, Hover | radius 4, 1px border, label `UI/Label Large`. Sm is the v3 default: 36px tall, pads 8/12 (8/16 on a lone action like "exportar pdf", whose border is `foreground`). Lg pads 12/20, Md pads 8/12. Hover table below |
| Toolbar Select | one | the content-header filter ("todas as automações", "setembro 2026"): 36px, 1px `border`, radius 4, pads 8/12, `UI/Label Large` in `muted-foreground` plus a 16px `chevron-down`. It is a filter control, not a form field, so its label is Space Grotesk, not Switzer |
| Field | State: Default, Hover, Focus, Error, Disabled | label `UI/Label` above, input pads 12/14, radius 4, 1px border. Hover darkens the border to graphite, Focus swaps it to `ring`. Error adds a hint in `destructive`. Disabled is opacity .6 |
| Textarea | one | as Field, min height 140, resize vertical only |
| Select | one | as Field plus a 16px `chevron-down` in `icon/secondary` |
| Checkbox | Checked: True, False. State: Default, Hover (4) | 18px square, radius 2. Checked fills `primary` with a graphite `check` glyph |
| Radio | Checked: True, False. State: Default, Hover (4) | 18px circle, dot in `accent-strong` so it reads against the pale fill. Round on purpose, see section 5 |
| Switch | On: True, False. State: Default, Hover (4) | 36x20 track, 14px knob |
| Icon / * | 24 components | Lucide at 24px, `currentColor` via `icon/*`. Artwork scales, so instances resize cleanly to 16 or 18 |
| Chip | one | the eyebrow chip: `muted` ground, radius 2, pads 6/8, `UI/Label` |
| Status Chip | Tone: Neutral, Accent, Error | a pill (radius 999, pads 4/10, `UI/Label`), allowed because it reads as data. Accent = `wash` fill, `accent-strong` border and ink ("no ar"); Neutral = `#f2f2f2` fill, default border, `muted-foreground` ink ("em implantação"); Error swaps in `destructive` |
| Avatar | Type: Photo, Initials. Size: Sm 24, Md 32, Lg 40 (6) | circle, 1px `border`. Photo carries a grayscale placeholder, Initials falls back to `UI/Label` on `tile`. Photos in the product are grayscale, same as the site |
| Divider | one | 1px in `border` |
| Key-Value Row | one | space between, pads 12 vertical, bottom rule. Key `UI/Body Small` muted, value `UI/Value` right aligned |
| Panel | one | the v3 grouping surface, used for every content section: a `#f2f2f2` frame, pad 6, radius 6, gap 6. Head pads 12/8 on the grey: `UI/Panel Title` plus an optional `UI/Body Small` subtitle in `muted-foreground`. The content is a paper block (radius 4 to 6) inside the frame. Panels sit on a paper canvas |
| Stat Card | Highlight: False, True | a Panel in miniature: grey frame (pad 6, radius 6) holding a paper card (radius 4, pad 16, gap 12: `UI/Label` in `muted-foreground`, number in `UI/Stat`, a support line in `UI/Body Small` secondary) plus a comparison footer on the frame (pad 4: `UI/Body Small Medium` value, rest muted). Highlight fills the card `highlight` `#bcf7fd`: the view's one cyan, at most once per screen. A usage meter inside is a 6px graphite bar on a `tile` track |
| Metric Cell | one | the unit of v3 table cells: a 28px icon tile (radius 2, `tile` ground, 16px Lucide icon) beside `UI/Body Small Medium` value over a `UI/Caption` caption ("110 / tarefas"). An empty metric keeps the tile and sets an em dash |
| Pending Item | one | the "precisa de você" row: paper, radius 4, pad 8, gap 12. A 36px icon tile (radius 2) on `destructive-wash` `#f9ebe9` with an 18px destructive icon, title `UI/Body Small Medium`, meta line `UI/Caption` in `muted-foreground`, and the action hard right as `UI/Label` in `accent-strong` |
| Task Row | one | a v3 task-table row: title `UI/Body Small Medium` over a `UI/Caption` meta line, destination as a Metric Cell (icon tile + label), time, and "sua parte" hard right: an outline button, a `UI/Label` action in `accent-strong`, or a muted state text |
| Card | one | 1px border, radius 4, pad 16 to 20, no shadow |
| Table Header Row | one | `UI/Label` cells in `muted-foreground`, pads 12, column gap 24, 1px bottom rule |
| Table Row | State: Default, Hover, Selected | pads 12, column gap 24, 1px bottom rule, last row bare. Two-line cells are the norm (title + caption). Hover is neutral grey, Selected is the cyan wash plus a 2px `accent-strong` left indicator. No vertical rules, no zebra, no card per row |
| Empty State | one | a 12px uppercase label, one Switzer 16px sentence, at most one outline button. No illustration |
| Sidebar Item | State: Default, Hover, Active. Badge: False, True (6) | 36px tall, pads 0/10, gap 8, radius 2, 14px icon, label `UI/Body Small`. Default ink is `muted-foreground`; Hover is neutral grey; **Active is a paper fill with a 1px border at radius 4 and `foreground` ink** (v3: the cyan wash no longer marks the active item). Badge puts a `Count Badge` hard right |
| Sidebar Group Label | one | a section heading inside the sidebar: `UI/Label` in `foreground`. Groups stack at gap 16 with a hairline Divider between them; items inside a group stack at gap 4, 8 under the label |
| Workspace Switcher | one | the client or workspace control: `tile` fill, 1px border, radius 4, pads 10, gap 8; a 24px mark (radius 2), the name in `UI/Body Small`, a 16px `chevron-down` hard right. Use this, not a `Field`, when the control names the thing you are looking at rather than collecting input |
| Account Menu | one | the logged-in account, at the sidebar footer: 44px tall, paper, 1px border, radius 4, pad 10, gap 10; a 24px round `Avatar Sm`, the name in `UI/Body Small`, a 16px `chevron-down` hard right |
| Count Badge | Tone: Accent, Neutral | a pending-items counter, pill radius 999, min-width 24, pads 4/8, number in `UI/Label`. Accent (cyan wash fill, `accent-strong` border and ink) when something waits on the client; Neutral (`#f2f2f2` fill, default border, `text/secondary` ink) for informative counts. A pill on purpose: it reads as data, same family as Status Chip |
| Filter Tab | State: Default, Active | one filter of a list (todas · precisa de você · concluídas): 32px tall, pads 10 left 6 right, gap 8, radius 4, label `UI/Body Small` with a Neutral `Count Badge` beside it. Default is bare with `text/secondary` ink; Active takes a paper fill, 1px border and `text/primary` ink, so it reads against the grey canvas |
| Tab | State: Default, Hover, Active | `UI/Label Large`, 14px bottom padding. Hover darkens the ink and shows a grey bar, Active takes the 2px `accent-strong` bar. The strip carries the full width rule |
| Segmented Control Item | State: Default, Hover, Active | one segment: pads 8/12, `UI/Label`, a left 1px hairline that divides it from the previous segment. Active fills `primary` with graphite ink, Hover takes the neutral grey. Compose them in a row inside a 1px bordered container at radius 2, clip it, and drop the left hairline on the first segment |
| Alert | Tone: Neutral, Accent, Error | 1px border, radius 3, pad 16, icon plus title plus body |
| Toast | one | graphite surface, because it floats over the paper ground |
| Peak Tag | one | the graphite chip over a chart's highlighted bar: `graphite` fill, radius 2, pads 3/6, `UI/Label` in paper ("16 set · 7 tarefas") |
| Top Bar | one | **retired in v3.** There is no full-width top bar: the logo lives in the sidebar header, the account in the sidebar footer (`Account Menu`), and the content area carries its own 60px header |
| Logo / Lockup | one | the real exported lockup, not a redraw. Graphite ink by default; override the artwork fill to `foreground-on-dark` on a graphite ground, the way `currentColor` works in the SVG |

Every variant is labelled on canvas: each set sits inside a spec frame with a
label column beside it, so `Primary · Md · Hover` is readable without selecting
anything. Single components carry a caption with their name.

**Tab, Segmented Control or Filter Tab?** A `Tab` switches what the page shows:
different content, same question. A `Segmented Control` filters what the page
already shows: same content, different slice, composed in one bordered row. A
`Filter Tab` is the loose version of the same filter, for a row of status
filters over a list, each carrying its count. A period switcher is a segmented
control; a status filter with counts is a row of filter tabs.

**The v3 App Shell** (the LAYOUT band's App Shell frame predates it and still
shows the retired top bar): a full-height 280px sidebar on `#f2f2f2` with a 1px
right rule, holding a 60px header (lockup at 100x26 left, an 18px `panel-left`
collapse icon right, hairline below) and a pad-16 body at gap 24: `Workspace
Switcher`, grouped navigation, and `Account Menu` pinned at the bottom. Beside
it, the content area on paper: its own 60px header (page title in `UI/Body` at
16 left; `Toolbar Select`s and the action button right; pads 0/24, hairline
below) and a pad-24 body stacking Panels at gap 16. On mobile (390) the sidebar
folds into the collapse icon, the header filters stack full-width under the
page title, and the Panels stack in one column.

### Button rest and hover

Hover is a real variant in Figma so it can be reviewed, and these are the values
to implement. All of it is on the paper ground.

| Variant | Rest | Hover |
|---|---|---|
| Primary | fill `primary`, border `primary`, ink `primary-foreground` | no fill, border and ink `accent-strong` |
| Outline | no fill, border and ink `foreground` | fill and border `primary`, ink `foreground` |
| Ghost | no fill, no border, ink `muted-foreground` | fill `accent` wash, ink `foreground` |
| Destructive | no fill, border and ink `destructive` | fill and border `destructive`, ink `destructive-foreground` |

Hover on the other controls: Field and the form controls darken their border to
`foreground`; Sidebar Item and Table Row take the neutral grey `muted`, never the
cyan wash, so hover never gets mistaken for selected; Tab darkens its ink and
shows a grey bar where the active bar would be.

Motion, from the screen dialect:

- colour, border and ink transitions: 180ms `--ease-out-soft`
- active state swap: 360ms
- collapsible open and close: 380 to 480ms
- focus visible mirrors hover and always shows the `ring`
- honour `prefers-reduced-motion` by rendering final states

Disabled stays a code state: opacity .6, no separate variant.

## 4. Density and structure

The landing page is marketing, a product screen is denser. Keep the grammar,
change the density.

- **the canvas is paper, the grouping is grey** (v3, inverting the Sep call):
  the content area sits on `#fafaf8`, and every section of content is a `Panel`,
  a `#f2f2f2` frame holding paper blocks. The sidebar is the one large grey
  surface (`#f2f2f2`, full height). Graphite is reserved for a toast, the chart
  Peak Tag and marketing panels inside the product
- a table is rows with 1px bottom rules inside a Panel's paper block; the header
  row carries the same 1px rule and the last row carries none
- cells pad 12 with a 24px column gap; two-line cells (title plus caption) are
  the norm, so rows breathe taller than the old 44px; content body pads 24
- separation is quiet on purpose: grey against paper is 8 values plus a 1px
  hairline, and nothing floats, so there is no shadow anywhere
- radius: 2 on tiles, chips and the Peak Tag; 4 on buttons, fields, cards and
  the active sidebar item; 6 on the Panel frame; 999 on Status Chip, Count
  Badge and Avatar. Nothing passes 6
- icons are Lucide in `currentColor`: 14 in the sidebar, 16 inside 28px tiles,
  18 inside 36px tiles, the set shadcn/ui ships
- charts (the v3 rules): bars in `highlight-chip` `#a9dde2` with a 2px top
  radius at gap 10; the highlighted bar (current month, peak day) in
  `accent-strong` `#1ac3d8`, marked with a graphite Peak Tag; a zero day keeps a
  3px `tile` stub; a secondary series ("esperou por você") stacks as graphite
  caps with a 2px gap; a 1px graphite baseline and no other gridline; a dashed
  reference line with its `UI/Caption` label; legend as 7px squares with
  `UI/Label` in `muted-foreground`; x labels in `UI/Caption`. In-table meters
  fill `highlight-chip` on a `tile` track; in-card usage meters fill graphite.
  A source under every chart, always

## 5. Decisions worth a second opinion

Seven calls were made while building the Sep system; the v3 screens later
overturned part of them, and the block after the list says exactly what. Any of
it can be reversed here and the rest follows.

1. **The canvas is grey.** `#f2f2f2` is the only grey the screen dialect ships,
   so panel-to-canvas separation is 8 values plus a 1px hairline: quiet by
   design, and consistent with a grammar built on hairlines rather than
   contrast. If it reads as too subtle, the honest options are a darker grey
   (a new brand value, needs a decision) or leaning harder on the borders. Do
   not reach for the deck's `#e9e9e8`: that belongs to the other dialect.
2. **The top bar is paper, not graphite.** The brand file reserves graphite for
   the top bar. Isadora called it on Sep 15 2026, and the result is more
   consistent with the screen dialect than the original: the shell becomes one
   continuous paper surface divided only by hairlines, which is rule one of the
   grammar. The logo carries graphite ink to suit. Graphite still owns the
   toast and any dark band inside the product.
3. **Lucide replaces Material Symbols.** The brand file says Material Symbols
   Outlined. shadcn/ui ships `lucide-react`, so using Material Symbols would mean
   overriding the icon in every shadcn component that carries one. Twenty Lucide
   icons are now components in Figma, and the brand file should be corrected to
   say Lucide for the platform. Both are 24px outline sets at a 2px stroke, so
   the drawing style does not change.
4. **Radio and Switch are round.** The brand says avatar and status pill are the
   only round shapes. A square radio is indistinguishable from a checkbox, which
   costs more than the rule saves, so they join the documented exceptions.
5. **Cell padding is 12px, not 11px.** The screen dialect writes `11px 16px`.
   12px keeps the 8px rhythm and the 44px row height intact.
6. **Hover on rows and nav is grey, not the cyan wash.** The wash already means
   selected. Using it for hover as well makes a table look like it has four
   selected rows under the cursor.
7. **Chart series are graphite, cyan and red.** The dark prototype coloured the
   three task series green, amber and red. The brand ships no green and no
   amber, so the example maps them to the sanctioned chart palette: graphite for
   the primary series (concluídas), `primary` cyan for the secondary one
   (aguardando cliente), and `destructive` red for erro, which is the one status
   colour the brand does hold. Three series is the most this palette carries
   cleanly; a fourth needs a decision, not an invention.

### What v3 changed (Oct 16 2026, measured from the screens)

The `Painel do cliente / v3 proposta (Claude)` screens supersede decisions 1
and 2 above and part of 5, 6 and 7:

1. **The canvas flipped.** Content sits on paper; grouping is done by grey
   `Panel` frames; the sidebar is the grey surface. (Supersedes decision 1.)
2. **The top bar is gone.** Full-height sidebar with its own 60px header (logo
   + collapse) and footer (`Account Menu`); the content area has its own 60px
   header with the page title at `UI/Body` 16 and the toolbar filters.
3. **Sidebar active is paper + border**, not the cyan wash: against the grey
   sidebar, selection is a paper surface with a hairline, the same move the
   `Filter Tab` makes against the paper canvas. Hover stays neutral grey.
4. **Muted text is a solid `#89898b`** (`text/secondary` in the Figma theme),
   replacing graphite at 50%, so it layers predictably on any surface.
5. **Status Chip is a pill** with wash fill and cyan border on Accent; the
   count moved into its own `Count Badge`.
6. **Radius moved up one notch**: controls and cards at 4, Panel frames at 6,
   tiles and small tags still at 2. (Amends "cell padding 12/16" too: cells pad
   12 with a 24px gap.)
7. **Charts lead with cyan**: `highlight-chip` bars, `accent-strong` highlight,
   graphite for the secondary series and the baseline. Graphite-as-primary-series
   (old decision 7) no longer matches the screens.
8. **Sidebar icons are 14px**, inside 36px items.

One v3 value is still unbound in Figma: the Pending Item's error tile ground is
a raw `#f9ebe9`. It is tokenised here as `destructive-wash`; bind it in Figma
when touching that component.

## 6. The example screens

The LAYOUT band's `App Shell` and the `🧪 EXAMPLE` band's **Painel do cliente**
on the Design System page are the Sep 2026 composition and predate v3: they
still show the top bar and the cyan-wash active item. The living example is the
v3 screen set itself (section `1423:426`, the twelve frames listed in the
intro). When updating the Design System page, rebuild those two frames from the
v3 screens rather than the other way around.

Panels in the screens are composed frames carrying `components/*` tokens rather
than `Card` instances, because Figma cannot express a container component with
a content slot. In code `Card` and `Panel` are composable containers and take
children normally.

## 7. Using it

```
src/styles/tokens.css   <- copy tokens.css
src/styles/theme.css    <- copy theme.css, it imports tokens.css
```

```html
<link href="https://api.fontshare.com/v2/css?f[]=switzer@400,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
```

Then install shadcn components as normal. They read `--background`,
`--foreground`, `--primary` and the rest, so they arrive on brand with no
per-component overrides. When a component needs something shadcn has no slot
for, use a `custom/*` token, never a hex.

Icons come from `lucide-react`, which shadcn already depends on. The dashboard
set in Figma: `file-text`, `package`, `bell`, `credit-card`, `key-round`,
`message-square`, `search`, `settings`, `download`, `external-link`, `calendar`,
`users`, `circle-check`, `circle-alert`, `check`, `plus`, `x`, `ellipsis`,
`chevron-down`, `chevron-right`, plus the v3 additions `panel-left` (sidebar
collapse) and `circle-dollar-sign`. Size them 14 (sidebar), 16 or 18 (tiles) or
24 and let them inherit `currentColor`.

For a graphite surface inside the product, put `.on-graphite` on that surface.
Do not put it on `<body>`.

## Onde ver

- ClickUp: [Create a basic Fator design system](https://app.clickup.com/t/86akezpjh), Sprint 4
- Figma: [💠Design System page](https://www.figma.com/design/5NeLWpK0hvQIZqDHnt03LJ/?node-id=1099-402) in the Fator AI file
- Figma, the reference screens: [Painel do cliente / v3 proposta](https://www.figma.com/design/5NeLWpK0hvQIZqDHnt03LJ/?node-id=1423-426)
- Reference architecture: [Orbit UI](https://www.figma.com/design/DEKMQifA8YOb3oxznHboSY/?node-id=2-287)
- Landing page code: [blockful/fator.ai.lp](https://github.com/blockful/fator.ai.lp)
- Brand source of truth: this repo, [`SKILL.md`](../SKILL.md)
