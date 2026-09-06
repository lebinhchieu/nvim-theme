-- Shared hex-color parsing, used by both contrast.lua (WCAG luminance) and
-- color.lua (alpha blending) so the two can't drift on how a hex string is
-- decoded.

local M = {}

function M.to_rgb(hex)
  hex = hex:gsub("^#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

return M
