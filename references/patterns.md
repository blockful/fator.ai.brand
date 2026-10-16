# Repertoire: copy-paste HTML/CSS

Every snippet assumes `tokens.css` is loaded. Fonts:

```html
<link rel="preconnect" href="https://api.fontshare.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://api.fontshare.com/v2/css?f[]=switzer@400,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500&display=swap" rel="stylesheet">
```

Base: `body{font-family:var(--font-body);color:var(--text-inverted);background:var(--bg-page)}`.
Dark ground: `.dark{background:var(--bg-dark);color:var(--text-primary)}`.

## Logo, inlined once

Paste the content of `logo/fator-logo.svg` into a hidden `<symbol>` at the top of `<body>`, then
place it with `<use>`. Colour follows `currentColor`, so the same symbol works on all three grounds.

```html
<svg style="display:none" aria-hidden="true">
  <symbol id="fatorlogo" viewBox="0 0 465 120"><!-- paths from logo/fator-logo.svg --></symbol>
</svg>
<svg class="logo" viewBox="0 0 465 120" role="img" aria-label="Fator AI"><use href="#fatorlogo"/></svg>
```
```css
.logo{width:108px;height:28px;color:var(--text-inverted);display:block}   /* deck default, top-right */
.dark .logo{color:var(--text-primary)}
.cover .logo{width:232px;height:60px}                                       /* cover: grows, goes left */
```

## Chip de seção (section chip)

```html
<span class="chip">Seção</span>
```
```css
.chip{display:inline-flex;align-self:flex-start;padding:6px 8px;border-radius:var(--radius-chip);
  background:var(--bg-muted);color:var(--text-inverted);
  font-family:var(--font-mono);font-weight:500;font-size:14px;line-height:1.12;letter-spacing:1px;text-transform:uppercase}
.cyan .chip{background:var(--bg-chip-on-cyan)}
.dark .chip{background:var(--accent-cyan)}
```

## Rótulo entre colchetes (bracket label)

```html
<p class="label">[1] instruir pessoas</p>
<p class="label">[nível 5]</p>
```
```css
.label{font-family:var(--font-mono);font-weight:500;font-size:13px;line-height:1.2;text-transform:uppercase}
```

## Régua de 1px (ruler)

```html
<div class="ruler"><i></i><span></span><i></i></div>
```
```css
.ruler{display:flex;align-items:center}
.ruler span{flex:1;height:1px;background:currentColor}
.ruler i{width:8px;height:8px;background:currentColor}
```

## Conector com nó (connector)

```html
<div class="connector"><span></span><i></i></div>
```
```css
.connector{display:flex;align-items:center}
.connector span{flex:1;height:1px;background:var(--border-dark)}
.connector i{width:12px;height:12px;background:var(--border-dark)}
```

## Malha de células (cell mesh)

Rows of 14px squares, 2px border, overlapping by 2px so strokes merge. Shorter rows read as volume.

```html
<div class="mesh">
  <div class="row"><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i></div>
  <div class="row"><i></i><i></i><i></i><i></i><i></i><i></i></div>
  <div class="row"><i></i><i></i><i></i><i></i></div>
</div>
```
```css
.mesh .row{display:flex;margin-bottom:-2px}
.mesh i{width:14px;height:14px;border:2px solid var(--border-dark);margin-right:-2px}
```

## Tile de ícone (icon tile)

```html
<div class="tile"><img src="icon.svg" alt=""></div>
```
```css
.tile{width:72px;height:72px;display:grid;place-items:center;border-radius:2px;background:var(--fill-tile)}
.tile img{width:36px;height:36px}
.tile.lg{width:96px;height:96px}.tile.lg img{width:44px;height:44px}
```

## Foto com legenda (photo with caption)

```html
<figure class="photo"><img src="equipe.jpg" alt="..."><figcaption>com vitalik buterin na suíça</figcaption></figure>
```
```css
.photo img{display:block;width:100%}
.photo figcaption{margin-top:4px;font-weight:500;font-size:12px;line-height:1.2;text-transform:uppercase;color:var(--text-muted)}
```

## Avatar de citação (quote avatar)

```html
<div class="quote-who"><img class="avatar" src="nick.jpg" alt=""><div><p class="n">nick johnson</p><p class="r">fundador do ens</p></div></div>
```
```css
.quote-who{display:flex;align-items:center;gap:8px}
.avatar{width:40px;height:40px;border-radius:50%;object-fit:cover}
.quote-who p{font-weight:500;font-size:12px;line-height:1.2;text-transform:uppercase}
.quote-who .r{color:var(--text-muted)}
```

## Atribuição de fonte (source attribution)

```html
<p class="source">mit, state of ai in business - 2025</p>
```
```css
.source{font-weight:500;font-size:12px;line-height:1.2;text-transform:uppercase;color:var(--text-muted)}
```

## Card and Destaque em ciano (card, cyan highlight)

```html
<div class="card">…</div>
<div class="card hl">a opção certa</div>
```
```css
.card{border:2px solid var(--border-dark);border-radius:3px;padding:20px;background:var(--bg-page)}
.card.hl{background:var(--accent-cyan)}      /* one per slide, maximum */
```

## Card de estatística (stat card)

```html
<div class="card stat">
  <p class="label">[usar chatgpt não é adotar ia]</p>
  <p class="num">95%</p>
  <p class="legend">dos pilotos de IA morrem sem impacto no resultado</p>
  <p class="source">mit, state of ai in business - 2025</p>
</div>
```
```css
.stat{display:flex;flex-direction:column;gap:20px}
.stat .num{font-size:72px;line-height:1;font-weight:400}
.stat .legend{font-size:18px;line-height:1.2;font-weight:500;margin-top:-16px}
```

## Linha com tile (row with tile)

```html
<div class="card hl row">
  <div class="tile lg"><img src="icon.svg" alt=""></div>
  <div>
    <p class="t">67% de sucesso com parceiro externo. O dobro.</p>
    <p class="b">Traz o conhecimento acumulado de outras operações e a tecnologia pronta para a sua.</p>
    <p class="source">mit, state of ai in business - 2025</p>
  </div>
</div>
```
```css
.row{display:flex;gap:16px;align-items:flex-start;padding:16px}
.row .t{font-size:20px;line-height:1.2}
.row .b{font-size:14px;line-height:1.4;margin:4px 0}
```

## Slide anatomy (what never changes)

```html
<section class="slide">                 <!-- 1280x720, padding 40px -->
  <header class="rail">                 <!-- chip left, logo right -->
    <span class="chip">Seção</span>
    <svg class="logo" viewBox="0 0 465 120"><use href="#fatorlogo"/></svg>
  </header>
  <h1>O título do slide entra aqui, alinhado à esquerda.</h1>   <!-- Deck/Título 52, top at 127px, never centred -->
  <div class="content">…</div>          <!-- one cyan highlight at most -->
</section>
```
```css
.slide{width:1280px;height:720px;padding:40px;display:flex;flex-direction:column;gap:28px;position:relative;overflow:hidden}
.rail{display:flex;justify-content:space-between;align-items:center}
.slide h1{font-weight:400;font-size:52px;line-height:1.2;text-align:left}
.slide.cover,.slide.closing{background:var(--bg-dark) url("../illustrations/malha-1280x720.svg") center/1280px 720px no-repeat;color:var(--text-primary)}
```

For a working deck do not assemble this by hand: clone `fator-html-presentation/templates/r2-criativos.html`,
which already carries the stage, the fit logic and these tokens.

## LP components (code, `fator.ai` repo)

Reuse, never re-style: `Button` (`variant="outline"` on light bands, `variant="solid"` cyan on dark
bands; Space Grotesk label; 2px radius; hover square + label roll), `Badge` (chip, 4px radius),
`Section` (`theme="light|dark"`, 1px rails), `Logo` (currentColor). Band context is
`.band--light` / `.band--dark`; the button palette flips with it.
