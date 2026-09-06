-- Completion menu highlight groups: blink.cmp (LazyVim's current default
-- completion engine) plus the classic nvim-cmp groups as a safety net for
-- anyone who's switched back to it.

local p = require("mango-parrot.palette")
local kinds = require("mango-parrot.kinds")
local blend = require("mango-parrot.color").blend

local M = {
  BlinkCmpMenu = { fg = p.base.fg, bg = p.base.bg_dim },
  BlinkCmpMenuBorder = { fg = p.base.border, bg = p.base.bg_dim },
  BlinkCmpMenuSelection = { bg = blend(p.accent.orange_bright, 30, p.base.bg_dim), bold = true },
  BlinkCmpLabel = { fg = p.base.fg },
  BlinkCmpLabelMatch = { fg = p.accent.orange, bold = true },
  BlinkCmpLabelDetail = { fg = p.base.fg_muted },
  BlinkCmpLabelDescription = { fg = p.base.fg_faint },
  BlinkCmpSource = { fg = p.base.fg_faint, italic = true },
  BlinkCmpGhostText = { fg = p.base.fg_faint, italic = true },
  BlinkCmpDoc = { fg = p.base.fg, bg = p.base.bg_dim },
  BlinkCmpDocBorder = { fg = p.base.border, bg = p.base.bg_dim },
  BlinkCmpDocSeparator = { fg = p.base.border },
  BlinkCmpDocCursorLine = { bg = p.base.bg_highlight },
  BlinkCmpSignatureHelp = { fg = p.base.fg, bg = p.base.bg_dim },
  BlinkCmpSignatureHelpBorder = { fg = p.base.border, bg = p.base.bg_dim },
  BlinkCmpSignatureHelpActiveParameter = { bg = blend(p.accent.orange_bright, 30, p.base.bg_dim), bold = true },

  CmpItemAbbr = { fg = p.base.fg },
  CmpItemAbbrDeprecated = { fg = p.base.fg_faint, strikethrough = true },
  CmpItemAbbrMatch = { fg = p.accent.orange, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = p.accent.orange, bold = true },
  CmpItemMenu = { fg = p.base.fg_faint, italic = true },
}

for kind, color in pairs(kinds) do
  M["BlinkCmpKind" .. kind] = { fg = color }
  M["CmpItemKind" .. kind] = { fg = color }
end

return M
