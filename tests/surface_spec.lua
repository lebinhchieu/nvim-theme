-- Invariants for the theme's surface/edge tones (palette.base).
--
-- These exist because a light theme has no drop shadow to fall back on. In
-- this setup Neovide's is switched off (it renders as a gray smudge on cream),
-- so the outline of a float is the ONLY thing separating it from the buffer
-- underneath -- the fill difference between `bg` and `bg_dim` is 1.08:1 and
-- will never carry that on its own. `border` is therefore held to a real
-- floor, while `guide` -- the same idea applied *inside* a surface, where that
-- weight would draw a cage around every nested block -- is held below it.
-- Run with: nvim -l tests/run_tests.lua

local contrast = require("mango-parrot.contrast")
local palette = require("mango-parrot.palette")

local T = {}

-- The point at which a hairline rule reads as a deliberate edge rather than a
-- rendering artifact, without tipping over into a drawn-on box outline.
local EDGE_MIN = 2.0

function T.test_border_reads_as_an_edge_on_every_surface_it_encloses()
  -- bg: window splits and tab separators. bg_dim: floats, popups, pickers.
  -- bg_alt is deliberately not in this list -- nothing outlined ever sits on
  -- it, so holding it to the edge floor would constrain a tone that no border
  -- is ever drawn against.
  for _, surface in ipairs({ "bg", "bg_dim" }) do
    local ratio = contrast.ratio(palette.base.border, palette.base[surface])
    assert(ratio >= EDGE_MIN, ("base.border on base.%s = %.2f, need >= %.2f"):format(surface, ratio, EDGE_MIN))
  end
end

function T.test_guide_is_quieter_than_border()
  local border = contrast.ratio(palette.base.border, palette.base.bg)
  local guide = contrast.ratio(palette.base.guide, palette.base.bg)
  assert(
    guide < border,
    ("guide (%.2f) must stay quieter than border (%.2f); they are separate roles"):format(guide, border)
  )
  -- ...but still present. Below this an indent guide stops being a guide.
  assert(guide >= 1.2, ("base.guide on bg = %.2f, need >= 1.20"):format(guide))
end

function T.test_cursorline_is_visible_without_drowning_the_text_on_it()
  local lift = contrast.ratio(palette.base.bg_highlight, palette.base.bg)
  assert(lift >= 1.15, ("CursorLine vs bg = %.3f, need >= 1.15 to read at all"):format(lift))
  local text = contrast.ratio(palette.base.fg, palette.base.bg_highlight)
  assert(text >= 7.0, ("base.fg on CursorLine = %.2f, need >= 7.0"):format(text))
end

function T.test_surfaces_get_progressively_deeper()
  -- bg (editor) -> bg_dim (panels/floats) -> bg_highlight (cursorline) ->
  -- bg_alt (deepest chrome). Ordering by contrast against `bg` keeps any
  -- future retone from accidentally inverting two rungs of the ladder.
  local ladder = { "bg_dim", "bg_highlight", "bg_alt" }
  local previous = 1.0
  for _, name in ipairs(ladder) do
    local ratio = contrast.ratio(palette.base[name], palette.base.bg)
    assert(
      ratio > previous,
      ("base.%s (%.3f vs bg) must be deeper than the rung before it (%.3f)"):format(name, ratio, previous)
    )
    previous = ratio
  end
end

return T
