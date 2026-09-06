-- Readability tests for the render-markdown.nvim heading bars.
--
-- Each bar is a tint of the very accent that gets written on top of it, so
-- bar strength and heading legibility trade directly against each other --
-- there is no tint at which the pair clears the 4.5:1 body-text floor, because
-- several heading accents sit at exactly 4.5:1 against the background to begin
-- with. Headings are bold and scanned rather than read as prose, so the floor
-- here is 4.0 -- the same one tests/lualine_spec.lua holds bold statusline
-- labels to, and stricter than WCAG's 3:1 for large text.
-- Run with: nvim -l tests/run_tests.lua

local contrast = require("mango-parrot.contrast")
local palette = require("mango-parrot.palette")
local groups = require("mango-parrot.highlights").groups()

local T = {}

local HEADING_MIN = 4.0
local LEVELS = 6

function T.test_every_heading_stays_legible_on_its_own_bar()
  for level = 1, LEVELS do
    local name = "RenderMarkdownH" .. level .. "Bg"
    local hl = groups[name]
    assert(hl and hl.fg and hl.bg, ("%s is missing fg/bg"):format(name))
    local ratio = contrast.ratio(hl.fg, hl.bg)
    assert(
      ratio >= HEADING_MIN,
      ("%s: fg %s on bar %s = %.2f, need >= %.2f -- lower BAR_ALPHA"):format(name, hl.fg, hl.bg, ratio, HEADING_MIN)
    )
  end
end

function T.test_every_bar_is_actually_a_visible_band()
  for level = 1, LEVELS do
    local hl = groups["RenderMarkdownH" .. level .. "Bg"]
    local ratio = contrast.ratio(hl.bg, palette.base.bg)
    assert(
      ratio > 1.1,
      ("RenderMarkdownH%dBg: bar %s vs bg = %.3f, too faint to read as a band"):format(level, hl.bg, ratio)
    )
  end
end

function T.test_bar_foregrounds_match_the_treesitter_heading_ramp()
  -- The bar and the bare heading are two renderings of the same thing; if
  -- they drift, a heading changes color the moment a background is enabled.
  for level = 1, LEVELS do
    local bar = groups["RenderMarkdownH" .. level .. "Bg"]
    local plain = groups["@markup.heading." .. level]
    assert(plain and plain.fg, ("@markup.heading.%d is missing"):format(level))
    assert(bar.fg == plain.fg, ("H%d: bar fg %s != @markup.heading.%d fg %s"):format(level, bar.fg, level, plain.fg))
  end
end

return T
