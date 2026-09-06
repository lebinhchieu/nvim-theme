-- todo-comments.nvim highlight groups
-- (lua/todo-comments/config.lua upstream).
--
-- Upstream derives each keyword's color by reading the foreground off a
-- highlight group and then using that hex as a *background*. Two of its
-- defaults (`PERF` and `TEST`) resolve through `Identifier`, which this theme
-- sets to the body text color -- so an unthemed setup paints `PERF:` and
-- `TEST:` as near-black bars in the middle of a cream comment. Declaring the
-- groups here skips the derivation entirely.
--
-- Upstream registers these with `hi def`, so whichever order the plugin and
-- the colorscheme load in, these definitions win.

local p = require("mango-parrot.palette")

-- Keys are todo-comments' primary keywords; its `alt` lists (FIXME, BUG,
-- OPTIM, INFO, ...) all resolve to the primary name before the highlight
-- group is picked, so they inherit these without needing their own entries.
local keywords = {
  FIX = p.diagnostic.error,
  TODO = p.diagnostic.info,
  HACK = p.diagnostic.warn,
  WARN = p.diagnostic.warn,
  PERF = p.accent.number,
  NOTE = p.diagnostic.hint,
  TEST = p.accent.keyword,
}

local M = {}

for keyword, color in pairs(keywords) do
  -- Every accent used here clears 4.5:1 against `bg`, which makes the reverse
  -- pairing (cream text on the accent as a fill) clear it too.
  M["TodoBg" .. keyword] = { fg = p.base.bg, bg = color, bold = true }
  M["TodoFg" .. keyword] = { fg = color }
  M["TodoSign" .. keyword] = { fg = color, bg = p.base.bg }
end

return M
