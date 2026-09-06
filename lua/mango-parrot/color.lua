-- Alpha-blending helper. `nvim_set_hl` only accepts solid 6-digit hex for
-- `fg`/`bg` (no VS Code-style 8-digit alpha hex), so every "color at N%
-- opacity over a background" from the source VS Code theme (e.g.
-- `editor.selectionBackground: #E8820E35`) has to be pre-flattened into a
-- solid hex here instead.

local hex_to_rgb = require("mango-parrot.hex").to_rgb

local M = {}

local function rgb_to_hex(r, g, b)
  return ("#%02X%02X%02X"):format(math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

--- Flattens `hex` at `alpha_pct`% opacity over `bg_hex` into a solid hex color.
function M.blend(hex, alpha_pct, bg_hex)
  local fr, fg, fb = hex_to_rgb(hex)
  local br, bg, bb = hex_to_rgb(bg_hex)
  local a = alpha_pct / 100
  return rgb_to_hex(fr * a + br * (1 - a), fg * a + bg * (1 - a), fb * a + bb * (1 - a))
end

return M
