#!/usr/bin/env bash
# Fator AI visual-identity gate. Usage: brand-check.sh <file-or-directory> [--copy-only]
# Exit 0 = clean, 1 = findings. Greps catch the wrong hex; only your eyes catch two highlights
# on one slide, a centred title or a stock photo. Run both.
set -uo pipefail
T="${1:-.}"; MODE="${2:-all}"; FAIL=0
# This repo's own documentation (SKILL.md, README.md, references/, the tokens in colors/) quotes
# the banned hexes, faces and claims on purpose, so it is skipped. Everything else is checked.
G=(grep -rInE --binary-files=without-match
   --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=dist --exclude-dir=build
   --exclude-dir=references --exclude-dir=colors --exclude=SKILL.md --exclude=README.md
   --exclude=fonts-embedded.css --exclude=brand-check.sh)

hit(){ # hit <label> <pattern> [invert-pattern]
  local label="$1" pat="$2" out
  out="$("${G[@]}" "$pat" "$T" 2>/dev/null || true)"
  [ -n "${3:-}" ] && out="$(printf '%s\n' "$out" | grep -vE "$3" || true)"
  if [ -n "$out" ]; then
    FAIL=1; printf '\n\033[1m✗ %s\033[0m\n' "$label"; printf '%s\n' "$out" | head -20
    local n; n="$(printf '%s\n' "$out" | wc -l)"; [ "$n" -gt 20 ] && echo "  … $((n-20)) more"
  else
    printf '\033[32m✓\033[0m %s\n' "$label"
  fi
}

echo "Fator AI brand check · $T"
if [ "$MODE" != "--copy-only" ]; then
  hit "retired palettes (May 2026 teal, Apr 2026 cream and ochre)" \
      '#?(e6ecf0|0a1c1e|a4f5ff|f7f4ee|efeae0|c29a56|0f0e0c|1a1815|5a554c)\b'
  hit "retired or forbidden typefaces (Gambarino outside the logo, IBM Plex, Inter)" \
      'gambarino|ibm.?plex|plex.?(mono|sans)|["'"'"' ]inter["'"'"',]'
  hit "bold weights (the brand stops at Medium 500)" \
      'font-weight: ?(600|700|800|900)|wght@[0-9;,]*(600|700|800|900)|font: ?(600|700)'
  # A hard-stop gradient (…Npx,transparent Npx) draws a rule or a lattice, not a gradient: allowed.
  hit "shadow, gradient, blur (flat brand; the LP product-window shadow is screen-only)" \
      'box-shadow|text-shadow|(linear|radial|conic)-gradient|backdrop-filter|filter: ?blur' \
      'px, ?transparent [0-9]|px ?[0-9]*%?, ?transparent'
  hit "radius above 4px (2px chip, 3px card, 4px badge; 50%/999px allowed on avatars and status pills)" \
      'border-radius: ?([5-9]|[1-9][0-9]+)px' 'border-radius: ?(999|50%)'
  # 303134 is the flattened malha stroke (#FAFAF8 at 7% on #202125), documented in templates/deck.html.
  hit "off-palette hex (anything outside the seven-colour ramp and its documented derivations)" \
      '#(0[0-9a-f]{5}|[1-9a-f][0-9a-f]{5})' \
      '#(fafaf8|202125|f2f2f2|e9e9e8|bcf7fd|1ac3d8|a9dde2|ecf9f9|404b51|c0392b|ff9a9a|0b0c0d|303134|fff|000|FAFAF8|202125|BCF7FD|1AC3D8|A9DDE2|ECF9F9)'
  hit "external images (a forwarded deck must render offline)" 'src="http'
fi
hit "em and en dashes" '—|–'
hit "banned vocabulary" \
    '\bstudio\b|transforma(ç|c)(ã|a)o|jornada|parceiro|empower|leverage|AI-powered|unlock|synergy'
hit "claims that are not true (client ownership of code or models, certifications not held)" \
    'seu c(ó|o)digo|c(ó|o)digo (é|e) (seu|do cliente)|reposit(ó|o)rio do cliente|ISO ?27001|SOC ?2|100% segur'

echo
if [ "$FAIL" = 0 ]; then
  echo "Clean. Now look at it: one cyan highlight per piece, titles left-aligned, sources under every"
  echo "number, real photos only, no widow words."
else
  echo "Fix the findings above, then look at it. See SKILL.md §8 for what each gate protects."
fi
exit "$FAIL"
