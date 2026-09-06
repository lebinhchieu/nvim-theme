-- Tests for lua/mango-parrot/contrast.lua (WCAG 2.1 relative-luminance contrast ratio).
-- Run with: nvim -l tests/run_tests.lua

local contrast = require("mango-parrot.contrast")

local T = {}

function T.test_ratio_of_color_against_itself_is_1()
  assert(math.abs(contrast.ratio("#FCF8F1", "#FCF8F1") - 1.0) < 0.001)
end

function T.test_black_on_white_is_max_ratio()
  -- WCAG's canonical example: pure black vs pure white = 21:1
  local r = contrast.ratio("#000000", "#FFFFFF")
  assert(math.abs(r - 21.0) < 0.01, ("expected ~21.0, got %s"):format(r))
end

function T.test_ratio_is_symmetric()
  local a = contrast.ratio("#3E372E", "#FCF8F1")
  local b = contrast.ratio("#FCF8F1", "#3E372E")
  assert(math.abs(a - b) < 0.0001)
end

function T.test_known_wcag_reference_value()
  -- #767676 on #FFFFFF is the textbook "just barely passes AA" gray, ~4.54:1
  local r = contrast.ratio("#767676", "#FFFFFF")
  assert(r > 4.5 and r < 4.6, ("expected ~4.5, got %s"):format(r))
end

function T.test_meets_aa_helper()
  assert(contrast.meets_aa("#000000", "#FFFFFF", 4.5) == true)
  assert(contrast.meets_aa("#FCF8F1", "#FCF8F1", 4.5) == false)
end

return T
