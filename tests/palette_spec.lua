-- Readability tests for lua/mango-parrot/palette.lua.
-- Mango Parrot's source VS Code palette (themes/mango-parrot-color-theme.json)
-- has several hues that are too low-contrast for sustained reading against
-- the `#FCF8F1` background once rendered as plain terminal text rather than
-- VS Code's TextMate renderer. These tests pin the WCAG AA floors agreed
-- during grilling: 4.5:1 for anything read as prose/code text, 3.0:1 for
-- deliberately de-emphasized glyphs (punctuation) or decorative fills.
-- Run with: nvim -l tests/run_tests.lua

local contrast = require("mango-parrot.contrast")
local palette = require("mango-parrot.palette")

local T = {}

local TEXT_MIN = 4.5
local DECORATIVE_MIN = 3.0

local function assert_meets(hex, minimum, label)
  local ratio = contrast.ratio(hex, palette.base.bg)
  assert(
    ratio >= minimum,
    ("%s (%s) contrast on bg = %.2f, need >= %.2f"):format(label, hex, ratio, minimum)
  )
end

function T.test_foreground_on_background_is_highly_readable()
  assert_meets(palette.base.fg, 7.0, "base.fg")
end

function T.test_comment_and_muted_text_meet_aa()
  assert_meets(palette.base.fg_muted, TEXT_MIN, "base.fg_muted (comments)")
end

function T.test_punctuation_meets_decorative_floor()
  assert_meets(palette.base.fg_dim, DECORATIVE_MIN, "base.fg_dim (punctuation)")
end

function T.test_syntax_accent_roles_meet_aa()
  local text_roles = {
    "keyword",
    "string",
    "string_escape",
    "number",
    "type",
    "orange",
    "function_",
    "operator",
    "property",
  }
  for _, role in ipairs(text_roles) do
    local hex = palette.accent[role]
    assert(hex, ("palette.accent.%s is missing"):format(role))
    assert_meets(hex, TEXT_MIN, "accent." .. role)
  end
end

function T.test_diagnostic_colors_meet_aa()
  for _, role in ipairs({ "error", "warn", "info", "hint", "ok" }) do
    local hex = palette.diagnostic[role]
    assert(hex, ("palette.diagnostic.%s is missing"):format(role))
    assert_meets(hex, TEXT_MIN, "diagnostic." .. role)
  end
end

function T.test_ansi_normal_colors_meet_aa_except_black()
  for name, hex in pairs(palette.ansi.normal) do
    if name ~= "black" then
      assert_meets(hex, TEXT_MIN, "ansi.normal." .. name)
    end
  end
end

function T.test_ansi_bright_colors_meet_aa_except_white()
  for name, hex in pairs(palette.ansi.bright) do
    if name ~= "white" then
      assert_meets(hex, TEXT_MIN, "ansi.bright." .. name)
    end
  end
end

function T.test_brand_orange_fill_is_exempt_from_text_floor()
  -- accent.orange_bright is a fill/cursor/border color, never rendered as
  -- text directly on `bg` -- it's intentionally below the text floor.
  local ratio = contrast.ratio(palette.accent.orange_bright, palette.base.bg)
  assert(ratio < TEXT_MIN, "expected orange_bright to stay a low-contrast fill color")
end

return T
