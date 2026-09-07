-- Invariants that only hold once every highlight module is merged, rather
-- than over the palette in isolation.
-- Run with: nvim -l tests/run_tests.lua

local contrast = require("mango-parrot.contrast")
local palette = require("mango-parrot.palette")
local highlights = require("mango-parrot.highlights")

local T = {}

local FILL_TEXT_MIN = 4.0
local KEYWORD_BADGE_MIN = 4.5

function T.test_modules_merge_without_a_group_collision()
  -- highlights.groups() raises on a duplicate rather than silently dropping
  -- one definition, so merging at all is the assertion.
  local groups = highlights.groups()
  assert(next(groups) ~= nil, "expected a non-empty highlight table")
end

function T.test_text_on_the_brand_orange_fill_stays_readable()
  -- accent.orange_bright is exempt from the palette's text floor because it is
  -- a fill, but a fill still has text written on it -- the cursor's glyph, the
  -- current search match, a TODO tag, Lazy's header. Cream on brand orange is
  -- 2.60:1; the theme's cocoa foreground is 4.26:1, which is the pairing
  -- lua/lualine/themes/mango-parrot.lua already settled on for normal mode.
  local checked = 0
  for name, hl in pairs(highlights.groups()) do
    if hl.bg == palette.accent.orange_bright and type(hl.fg) == "string" then
      local ratio = contrast.ratio(hl.fg, hl.bg)
      assert(
        ratio >= FILL_TEXT_MIN,
        ("%s: fg %s on the brand orange fill = %.2f, need >= %.2f"):format(name, hl.fg, ratio, FILL_TEXT_MIN)
      )
      checked = checked + 1
    end
  end
  assert(checked > 0, "expected at least one group to render text on the brand fill")
end

function T.test_todo_keyword_badges_are_legible()
  -- todo-comments uses each keyword's color as a *background* with the theme
  -- foreground on top; upstream's own derivation resolves two of them
  -- (PERF, TEST) through Identifier, which lands on the body text color.
  local groups = highlights.groups()
  local checked = 0
  for name, hl in pairs(groups) do
    if name:match("^TodoBg") then
      assert(hl.fg and hl.bg, ("%s is missing fg/bg"):format(name))
      local ratio = contrast.ratio(hl.fg, hl.bg)
      assert(
        ratio >= KEYWORD_BADGE_MIN,
        ("%s: fg %s on %s = %.2f, need >= %.2f"):format(name, hl.fg, hl.bg, ratio, KEYWORD_BADGE_MIN)
      )
      checked = checked + 1
    end
  end
  assert(checked >= 7, ("expected all 7 todo keywords, found %d"):format(checked))
end

-- Groups whose name looks like float chrome but which are actually drawn as
-- ordinary text inside a buffer or a float's body, where a hard-coded
-- background would paint a band across unrelated content.
local NOT_FLOAT_CHROME = {
  Title = "the generic :h hl-Title, used for help headings and :set output",
  RenderMarkdownLinkTitle = "inline markdown text in a normal buffer",
  NoiceFormatTitle = "notification body content, not the border row",
  NoiceLspProgressTitle = "notification body content, not the border row",
  SnacksDashboardFooter = "the dashboard is a normal window on `bg`, not a float",
}

function T.test_float_chrome_groups_carry_an_explicit_background()
  -- A title/footer/border group is painted into a float's BORDER row. If it
  -- has no `bg`, the cell falls back to the global `Normal` background instead
  -- of the float's own fill, and the title renders as a lighter patch sitting
  -- on top of the panel -- visible wherever a plugin routes its title through
  -- `winhighlight`, as snacks does with `FloatTitle:SnacksTitle`.
  local offenders = {}
  for name, hl in pairs(highlights.groups()) do
    local is_chrome = name:match("Title") or name:match("Footer") or name:match("Border")
      or name:match("^SnacksWinKey") or name:match("^SnacksNotifierIcon")
    if is_chrome and not NOT_FLOAT_CHROME[name] and not hl.link and not hl.bg then
      offenders[#offenders + 1] = name
    end
  end
  table.sort(offenders)
  assert(
    #offenders == 0,
    ("float chrome without an explicit bg: %s"):format(table.concat(offenders, ", "))
  )
end

-- Drawn in the screen grid, outside any window's text area. Unlike a group
-- used inside a window -- which resolves an unset background against that
-- window's `winhighlight`-remapped Normal -- these fall back to the global
-- Normal, so they show the editor background wherever they touch a panel.
local WINDOW_GRID_CHROME = { "WinSeparator", "MsgSeparator" }

function T.test_window_grid_chrome_carries_an_explicit_background()
  local groups = highlights.groups()
  for _, name in ipairs(WINDOW_GRID_CHROME) do
    local hl = groups[name]
    assert(hl, ("%s is not defined"):format(name))
    assert(hl.bg, ("%s has no bg; it will render the global Normal against panels"):format(name))
  end
end

function T.test_on_highlights_hook_gets_the_last_word()
  local config = require("mango-parrot.config")
  local saved = config.options.on_highlights
  config.options.on_highlights = function(hl)
    hl.Normal = { fg = "#123456" }
  end
  local ok, groups = pcall(highlights.groups)
  config.options.on_highlights = saved
  assert(ok, "groups() raised while running the on_highlights hook")
  assert(groups.Normal.fg == "#123456", "on_highlights did not override Normal")
end

return T
