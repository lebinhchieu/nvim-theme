-- WCAG 2.1 relative-luminance contrast ratio, used to keep the palette
-- readable against the theme's cream background (see palette.lua).
-- https://www.w3.org/TR/WCAG21/#contrast-minimum

local hex_to_rgb = require("mango-parrot.hex").to_rgb

local M = {}

local function linearize(channel)
  local c = channel / 255
  if c <= 0.03928 then
    return c / 12.92
  end
  return ((c + 0.055) / 1.055) ^ 2.4
end

local function relative_luminance(hex)
  local r, g, b = hex_to_rgb(hex)
  return 0.2126 * linearize(r) + 0.7152 * linearize(g) + 0.0722 * linearize(b)
end

--- Contrast ratio between two hex colors, per WCAG 2.1 (1.0 to 21.0).
function M.ratio(hex_a, hex_b)
  local l1, l2 = relative_luminance(hex_a), relative_luminance(hex_b)
  if l1 < l2 then
    l1, l2 = l2, l1
  end
  return (l1 + 0.05) / (l2 + 0.05)
end

--- Whether hex_a on hex_b meets or exceeds the given minimum ratio
--- (4.5 for normal text, 3.0 for large text/UI components, per WCAG AA).
function M.meets_aa(hex_a, hex_b, minimum)
  return M.ratio(hex_a, hex_b) >= minimum
end

return M
