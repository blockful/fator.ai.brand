# Data, reports, spreadsheets and documents

The brand was written for slides and screens, so this file extends it to the surfaces that carry
numbers and prose: a spreadsheet, a monthly client report, a PDF, a one-pager, a proposal, a memo.
Read `../SKILL.md` §2-§4 first; only the medium-specific decisions live here.

The governing idea: **a Fator document is a table of facts with one thing highlighted.** The visual
work is done by 1px rules, uppercase labels and whitespace. Nothing is boxed unless it floats, and
nothing is coloured unless it is the answer.

## 1. Spreadsheets (Excel, Google Sheets, CSV exports)

A spreadsheet is the hardest surface to keep on brand because the defaults fight you. Set these and
stop there.

| Element | Spec |
|---|---|
| Fonts | Switzer for content. If the tool cannot embed it (Excel, Sheets without the font installed) fall back to Aptos or Arial for content and **Space Grotesk for headers**, which is available in Google Fonts and so installable in Sheets. Never Calibri's italic default, never a serif |
| Header row | Space Grotesk 10 to 11pt, uppercase, 1px letter-spacing where the tool allows, graphite ink on paper `#fafaf8`, a single **bottom** border 1px `#202125`. No fill, no bold-and-fill both |
| Body rows | Switzer or fallback 10 to 11pt graphite on paper, row height 20 to 22pt, bottom border `rgba(32,33,37,.12)` (use `#e6e6e5` where alpha is unavailable) |
| Vertical rules | None. Columns separate by alignment and whitespace |
| Zebra striping | None. If rows must be grouped, insert a 6pt spacer row, not a fill |
| Numbers | Right-aligned, PT-BR format: thousands `.`, decimals `,`, `R$ 1.284,00`, `98,4%`. One decimal unless the unit demands more. Currency and percent live in the cell format, never typed into the value |
| Text | Left-aligned, no wrap inside a data column; widen the column instead |
| The one highlight | The row, column or cell that answers the question gets fill `#bcf7fd` with graphite ink, or for a milder emphasis fill `#ecf9f9`. One highlight per sheet |
| Status cells | Text in `#1ac3d8` or a `#ecf9f9` fill. Never red-amber-green: the brand has no green or amber. For a real pass and fail, use graphite text plus the cyan fill for pass and plain paper with muted ink for fail, and say so in a legend |
| Negative numbers | Graphite with a minus sign, not red, unless the sheet is a financial statement where red is the convention. Then use `#c0392b` |
| Totals | A 1px `#202125` top border and Space Grotesk for the number. No double underline, no bold-and-border both |
| Tab names | Lowercase, no emoji, no colour coding beyond one cyan tab for the sheet that matters |
| Charts inside a sheet | §4 below |
| Freeze and filters | Freeze the header row. Keep filter arrows off in a delivered report; they are a working tool, not a finish |
| Gridlines | Off in any sheet that will be seen. The 1px row rules are the grid |

Deliverable hygiene: name the file `fator-<assunto>-<AAAA-MM>.xlsx`, put the source and the date in
a footer row in `.type-source` style (Space Grotesk 9pt uppercase muted), and never ship a sheet whose
first cell is `A1` empty with a title floating in `B2`. Title in `A1`, one blank row, then the header.

## 2. Reports and PDFs

**Route check first.** If the PDF is going to a client or a lead (forwarded material, a WhatsApp
piece, a proposal annex), it is a **landscape deck**: `deck.md` + `templates/deck.html`, page cap
per the ask. Isadora's ruling, Sep 2026, after an A4 portrait lead piece was rejected as not
visual. The A4 portrait form below is for internal reports and documents read as paper.

A report is a stack of the same blocks a slide uses, set at document scale on A4 or Letter portrait.

- **Page:** paper `#fafaf8` ground, margins 40 to 48px (or 15mm), a 1px rule under the header and
  above the footer. Header carries the logo at 96 to 108px wide on the left or right, consistently.
  Footer carries `.type-source`-style meta: client, period, page number.
- **Type scale for documents** (between the deck and the LP scales):

| Role | Font | Size / line-height |
|---|---|---|
| Document title | Switzer Regular | 40 / 1.15 |
| Section title | Switzer Regular | 24 / 1.2 |
| Subsection | Switzer Medium | 18 / 1.25 |
| Body | Switzer Regular | 11 to 12 / 1.5 |
| Caption and source | Switzer Medium | 9 to 10 / 1.2, uppercase, muted |
| Label and eyebrow | Space Grotesk Medium | 10 / 1.2, uppercase, 1px |
| Statistic number | Switzer Regular | 40 to 56 / 1 |

- **Structure:** one idea per section, an uppercase eyebrow above each section title, tables instead
  of bullet lists wherever the content is parallel. A bulleted list uses the 7px cyan square.
- **Tables:** as in §1. Header row uppercase with a bottom rule, body rows with hairline rules, no
  vertical rules, numbers right-aligned, one highlighted row at most.
- **Statistic block:** the deck's stat card at document scale, without the 2px border if it sits
  inline: bracket label, big number, one-line legend, source line underneath. Every number cites its
  source; that is a brand rule, not a nicety.
- **Executive summary:** three to five label-and-value rows before the prose. It is the same
  label-value row pattern, so it reads as Fator on sight.
- **Print production:** the palette converts to CMYK by the printer, not by you. Paper `#fafaf8` is
  the stock, so leave it unprinted. Keep cyan to one element per page.

## 3. Documents, one-pagers and memos

- Same type scale as §2. A one-pager is a title, an uppercase eyebrow, three to four sections and
  one highlighted fact. Nothing centred except a closing line.
- Prose follows the copy rules in `../SKILL.md` §4: short declaratives, colons instead of dashes,
  sentence-case headings without a final period, PT-BR numbers, no em dash.
- A quote carries the 40px round avatar, the name in uppercase Switzer Medium 12 and the role muted
  beneath it.
- Google Docs and Word: set Switzer if installed, otherwise the system sans; set the label style to
  Space Grotesk uppercase; kill the default blue link colour in favour of `#1ac3d8`; remove the
  default 1.15 line spacing in favour of 1.5 for body.

## 4. Charts and data visualisation

Load the `dataviz` skill for choosing the chart form, then apply this palette and these marks.

| Decision | Fator answer |
|---|---|
| Categorical series | Graphite `#202125` first, `#1ac3d8` for the series being argued about, `#a9dde2` third, `#404b51` fourth. Stop at four; beyond that the chart is the wrong form |
| Sequential ramp | `#ecf9f9` to `#a9dde2` to `#1ac3d8` to `#202125` |
| Highlight against a set | Every bar graphite, the one that matters `#bcf7fd` with a 1px graphite stroke |
| Axes and baseline | 1px `--border-grey` on paper, `--border-dark-blue` on graphite. Baseline only; no gridlines unless the reader must compare exact values, and then 1px at 8% opacity |
| Fills | Flat. No gradient, no shadow, no 3D, no rounded bar caps |
| Labels | Space Grotesk Medium 12 uppercase for axis and series labels, Switzer for value labels. Direct-label the series instead of a legend whenever there are three or fewer |
| Numbers | PT-BR format, unit stated once in the axis title, not repeated per tick |
| Source | A `.type-source` line under every chart. No exceptions |
| Dark ground | Only in a deck. Swap ink to paper, accent to `#bcf7fd`, rules to `#404b51` |

## 5. Interactive HTML tools

Teammate-facing generators and calculators are standalone offline `.html` files, not artifacts. The
current reference implementation is `fator-html-presentation/templates/rn-proposta.html`. It keeps its own
editor layout with a graphite sidebar and applies only the brand's logo and typography, so follow
that precedent: **the tool's own layout survives, the brand supplies the logo, the type and the
palette.** Embed the fonts from `fonts-embedded.css` (private skills repo, `fator-visual-id` skill) so the file works offline.
