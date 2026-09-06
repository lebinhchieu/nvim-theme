-- Tests for lua/mango-parrot/color.lua (alpha-blend flattening).

local color = require("mango-parrot.color")

local T = {}

function T.test_full_opacity_returns_the_foreground_color()
  assert(color.blend("#E8820E", 100, "#FCF8F1") == "#E8820E")
end

function T.test_zero_opacity_returns_the_background_color()
  assert(color.blend("#E8820E", 0, "#FCF8F1") == "#FCF8F1")
end

function T.test_half_opacity_averages_the_two_colors()
  -- pure red at 50% over pure blue -> mid gray-purple
  assert(color.blend("#FF0000", 50, "#0000FF") == "#800080")
end

return T
