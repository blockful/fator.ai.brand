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
| Button | Variant: Primary, Outline, Ghost, Destructive. Size: Md, Lg. State: Default, Hover (16) | radius 2, 1px border, label `UI/Label Large`. Lg pads 12/20, Md pads 8/12. Hover table below |
| Field | State: Default, Hover, Focus, Error, Disabled | label `UI/Label` above, input pads 12/14, radius 2, 1px border. Hover darkens the border to graphite, Focus swaps it to `ring`. Error adds a hint in `destructive`. Disabled is opacity .6 |
| Textarea | one | as Field, min height 140, resize vertical only |
| Select | one | as Field plus a 16px `chevron-down` in `icon/secondary` |
| Checkbox | Checked: True, False. State: Default, Hover (4) | 18px square, radius 2. Checked fills `primary` with a graphite `check` glyph |
| Radio | Checked: True, False. State: Default, Hover (4) | 18px circle, dot in `accent-strong` so it reads against the pale fill. Round on purpose, see section 5 |
| Switch | On: True, False. State: Default, Hover (4) | 36x20 track, 14px knob |
| Icon / * | 24 components | Lucide at 24px, `currentColor` via `icon/*`. Artwork scales, so instances resize cleanly to 16 or 18 |
| Chip | one | the eyebrow chip: `muted` ground, radius 2, pads 6/8, `UI/Label` |
| Status Chip | Tone: Neutral, Accent, Error | the one pill the brand allows, because it reads as data and not as a button |
| Avatar | Type: Photo, Initials. Size: Sm 24, Md 32, Lg 40 (6) | circle, 1px `border`. Photo carries a grayscale placeholder, Initials falls back to `UI/Label` on `tile`. Photos in the product are grayscale, same as the site |
| Divider | one | 1px in `border` |
| Key-Value Row | one | space between, pads 12 vertical, bottom rule. Key `UI/Body Small` muted, value `UI/Value` right aligned |
| Stat Card | Badge: False, True | 1px border, radius 3, pad 20. Label, number, and a source line under every number. Badge adds a chip beside the label, for a qualifier like "estimativa" |
| Task Row | one | 44px row, bottom rule. Code in `UI/Value`, name, up to two tag chips (hide the slots you do not need), then date, status chip and an `external-link` icon |
| Card | one | 1px border, radius 3, pad 20, no shadow |
| Table Header Row | one | `UI/Label` cells, 2px bottom rule |
| Table Row | State: Default, Hover, Selected | 44px rows, cells pad 12/16, 1px bottom rule. Hover is neutral grey, Selected is the cyan wash plus a 2px `accent-strong` left indicator. No vertical rules, no zebra, no card per row |
| Empty State | one | a 12px uppercase label, one Switzer 16px sentence, at most one outline button. No illustration |
| Sidebar Item | State: Default, Hover, Active. Badge: False, True (6) | pads 10/12, radius 2, 18px icon. Hover is neutral grey, Active takes the cyan wash and cyan ink. Badge puts a chip hard right, for a qualifier like "beta" |
| Sidebar Group Label | one | a section heading inside the sidebar: `UI/Label`, muted, 20px above and 8px below, so groups read as groups |
| Workspace Switcher | one | the client or workspace control: a 22px graphite mark with initials, the name in `UI/Body Small`, a `chevron-down` hard right. 1px border, radius 2. Use this, not a `Field`, when the control names the thing you are looking at rather than collecting input |
| Account Menu | one | the logged-in account, at the sidebar footer: 44px tall, paper, 1px border, radius 4, pad 10, gap 10; a 24px round `Avatar Sm`, the name in `UI/Body Small`, a 16px `chevron-down` hard right |
| Count Badge | Tone: Accent, Neutral | a pending-items counter, pill radius 999, min-width 24, pads 4/8, number in `UI/Label`. Accent (cyan wash fill, `accent-strong` border and ink) when something waits on the client; Neutral (`#f2f2f2` fill, default border, `text/secondary` ink) for informative counts. A pill on purpose: it reads as data, same family as Status Chip |
| Filter Tab | State: Default, Active | one filter of a list (todas · precisa de você · concluídas): 32px tall, pads 10 left 6 right, gap 8, radius 4, label `UI/Body Small` with a Neutral `Count Badge` beside it. Default is bare with `text/secondary` ink; Active takes a paper fill, 1px border and `text/primary` ink, so it reads against the grey canvas |
| Tab | State: Default, Hover, Active | `UI/Label Large`, 14px bottom padding. Hover darkens the ink and shows a grey bar, Active takes the 2px `accent-strong` bar. The strip carries the full width rule |
| Segmented Control Item | State: Default, Hover, Active | one segment: pads 8/12, `UI/Label`, a left 1px hairline that divides it from the previous segment. Active fills `primary` with graphite ink, Hover takes the neutral grey. Compose them in a row inside a 1px bordered container at radius 2, clip it, and drop the left hairline on the first segment |
| Alert | Tone: Neutral, Accent, Error | 1px border, radius 3, pad 16, icon plus title plus body |
| Toast | one | graphite surface, because it floats over the paper ground |
| Top Bar | one | 56px, **paper**, logo left, account and avatar right, 1px `border` bottom rule |
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

There is also an **App Shell** frame in the LAYOUT band showing all of it
assembled at 1440x900: top bar, paper sidebar, page header, stat row, tabs and
a table.

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

- **the canvas is grey, the panels are paper.** `canvas` (`#f2f2f2`) sits behind
  the content so cards read as cards; the sidebar, the top bar and every panel
  stay paper. Content that is not in a panel, such as a page header, sits
  directly on the canvas. Graphite is reserved for a toast, an empty state art
  area and marketing panels inside the product
- a table is rows with bottom rules, a header row with a heavier bottom rule
- row height 44 to 48, cell padding 12/16, section padding 24 to 32
- cards only when a group must float above the page, 1px border, radius 3, no
  shadow. The shadowed elevated card on the landing page is a marketing device
- icons are Lucide at 16, 18 or 24px in `currentColor`, the set shadcn/ui ships
- charts: graphite for the primary series, `#1ac3d8` for the highlighted one,
  `#a9dde2` and `#ecf9f9` for supporting fills, 1px axes, no gridlines beyond
  the baseline, no gradient fills, and a source under every chart

## 5. Decisions worth a second opinion

Seven calls were made while building. Any of them can be reversed here and the
rest follows.

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

## 6. The example page

`🧪 EXAMPLE` on the Figma page holds **Painel do cliente**, the dark prototype
rebuilt in this system. It is the proof that the parts compose: sidebar with a
`Workspace Switcher`, grouped navigation (`Sidebar Group Label` plus eight
`Sidebar Item`s, one carrying a badge), a period `Segmented Control`, an
`exportar` / `gerar relatório` action pair in the page header, four `Stat Card`s, a bar chart drawn to the chart rules (1px baseline, no gridlines,
Space Grotesk labels, a source under the numbers), an alerts panel and four
`Task Row`s.

Two things it does differently from the prototype, both on purpose: the ground
is paper rather than near-black, and the panels are composed frames carrying
`components/card/*` tokens rather than `Card` instances, because Figma cannot
express a container component with a content slot. In code `Card` is the
composable container and takes children normally.

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

Icons come from `lucide-react`, which shadcn already depends on. The twenty in
Figma are the dashboard set: `file-text`, `package`, `bell`, `credit-card`,
`key-round`, `message-square`, `search`, `settings`, `download`,
`external-link`, `calendar`, `users`, `circle-check`, `circle-alert`, `check`,
`plus`, `x`, `ellipsis`, `chevron-down`, `chevron-right`. Size them 16, 18 or 24
and let them inherit `currentColor`.

For a graphite surface inside the product, put `.on-graphite` on that surface.
Do not put it on `<body>`.

## Onde ver

- ClickUp: [Create a basic Fator design system](https://app.clickup.com/t/86akezpjh), Sprint 4
- Figma: [💠Design System page](https://www.figma.com/design/5NeLWpK0hvQIZqDHnt03LJ/?node-id=1099-402) in the Fator AI file
- Reference architecture: [Orbit UI](https://www.figma.com/design/DEKMQifA8YOb3oxznHboSY/?node-id=2-287)
- Landing page code: [blockful/fator.ai.lp](https://github.com/blockful/fator.ai.lp)
- Brand source of truth: this repo, [`SKILL.md`](../SKILL.md)
