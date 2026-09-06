-- snacks.nvim highlight groups (folke/snacks.nvim), covering the pieces
-- LazyVim enables by default: base floating windows, indent guides,
-- dashboard, notifier, statuscolumn, and picker (which Snacks Explorer
-- also reuses -- it's implemented as a picker source, not a separate
-- highlight namespace).

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

local M = {
  -- Base window (shared by dashboard/notifier/picker/explorer/terminal/zen)
  SnacksNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksNormalNC = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  -- Defined for completeness only. Current snacks builds its own
  -- `SnacksBackdrop_<hex>` group from `opts.backdrop.bg` (default #000000)
  -- and never reads this one, so the picker scrim can only be retoned from
  -- the user's snacks config, not from here.
  SnacksBackdrop = { bg = p.base.bg_alt, blend = 40 },
  SnacksTitle = { fg = p.accent.orange, bold = true },
  SnacksFooter = { fg = p.base.fg_muted },
  SnacksFooterDesc = { fg = p.base.fg_muted },
  SnacksFooterKey = { fg = p.accent.function_, bold = true },
  SnacksWinBar = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksWinBarNC = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  SnacksWinSeparator = { fg = p.base.border, bg = p.base.bg_dim },
  SnacksWinKey = { fg = p.accent.function_, bold = true },
  SnacksWinKeySep = { fg = p.base.fg_faint },
  SnacksWinKeyDesc = { fg = p.base.fg_muted },

  -- Indent guides
  SnacksIndent = { fg = p.base.border },
  SnacksIndentScope = { fg = p.accent.orange_bright },
  SnacksIndentChunk = { fg = p.accent.orange_bright },

  -- Statuscolumn
  SnacksStatusColumn = { fg = p.base.fg_faint },
  SnacksStatusColumnMark = { fg = p.accent.orange },

  -- Dashboard
  SnacksDashboardHeader = { fg = p.accent.orange, bold = true },
  SnacksDashboardFooter = { fg = p.base.fg_muted, italic = true },
  SnacksDashboardIcon = { fg = p.accent.function_ },
  SnacksDashboardDesc = { fg = p.base.fg },
  SnacksDashboardKey = { fg = p.accent.keyword, bold = true },
  SnacksDashboardDir = { fg = p.base.fg_muted },
  SnacksDashboardFile = { fg = p.base.fg },
  SnacksDashboardNormal = { fg = p.base.fg, bg = p.base.bg },
  SnacksDashboardTerminal = { fg = p.base.fg, bg = p.base.bg },

  -- Notifier history (non-level groups)
  SnacksNotifierHistoryTitle = { fg = p.accent.orange, bold = true },
  SnacksNotifierHistoryDateTime = { fg = p.base.fg_faint },
  SnacksNotifierMinimal = { fg = p.base.fg, bg = p.base.bg_dim },

  -- Picker / explorer
  SnacksPickerDir = { fg = p.base.fg_muted },
  SnacksPickerFile = { fg = p.base.fg },
  SnacksPickerDirectory = { fg = p.accent.function_ },
  SnacksPickerTree = { fg = p.base.fg_dim },
  SnacksPickerPathHidden = { fg = p.base.fg_faint },
  SnacksPickerPathIgnored = { fg = p.base.fg_faint, italic = true },
  SnacksPickerSelected = { fg = p.accent.orange, bold = true },
  SnacksPickerUnselected = { fg = p.base.fg_dim },
  SnacksPickerMatch = { fg = p.accent.orange, bold = true },
  SnacksPickerInput = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksPickerInputSearch = { fg = p.accent.string_escape },
  SnacksPickerPrompt = { fg = p.accent.keyword },
  SnacksPickerList = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksPickerListCursorLine = { bg = blend(p.accent.orange_bright, 25, p.base.bg_dim) },
  SnacksPickerPreview = { fg = p.base.fg, bg = p.base.bg },
  SnacksPickerPreviewCursorLine = { bg = p.base.bg_highlight },
  SnacksPickerToggle = { fg = p.base.bg, bg = p.accent.orange_bright },
  SnacksPickerSpinner = { fg = p.accent.orange },
  SnacksPickerBufFlags = { fg = p.diagnostic.warn },
  SnacksPickerBufNr = { fg = p.base.fg_faint },
  SnacksPickerBufType = { fg = p.base.fg_muted },

  SnacksPickerGitStatusAdded = { fg = p.diff.add },
  SnacksPickerGitStatusModified = { fg = p.diff.change },
  SnacksPickerGitStatusDeleted = { fg = p.diff.delete },
  SnacksPickerGitStatusRenamed = { fg = p.diff.rename },
  SnacksPickerGitStatusCopied = { fg = p.diff.rename },
  SnacksPickerGitStatusStaged = { fg = p.diff.add, bold = true },
  SnacksPickerGitStatusUnmerged = { fg = p.diagnostic.error },
  SnacksPickerGitStatusUntracked = { fg = p.diff.add, italic = true },
  SnacksPickerGitBranch = { fg = p.base.fg_muted },
  SnacksPickerGitBranchCurrent = { fg = p.accent.keyword, bold = true },
  SnacksPickerGitCommit = { fg = p.accent.string_escape },
  SnacksPickerGitAuthor = { fg = p.accent.type },
  SnacksPickerGitDate = { fg = p.base.fg_faint },
  SnacksPickerGitMsg = { fg = p.base.fg },
}

-- Indent-guide levels 1-8: all on the same subtle border tone. A per-level
-- rainbow was tried and read as visual noise down the tree -- SnacksIndentScope
-- and SnacksIndentChunk already carry the one accent that matters.
for i = 1, 8 do
  M["SnacksIndent" .. i] = { fg = p.base.border }
end

-- Notifier levels: Error/Warn/Info/Debug/Trace, each with Icon/Border/Title/Footer.
local notifier_levels = {
  Error = p.diagnostic.error,
  Warn = p.diagnostic.warn,
  Info = p.diagnostic.info,
  Debug = p.base.fg_muted,
  Trace = p.base.fg_faint,
}
for level, color in pairs(notifier_levels) do
  M["SnacksNotifierIcon" .. level] = { fg = color }
  M["SnacksNotifierBorder" .. level] = { fg = color }
  M["SnacksNotifierTitle" .. level] = { fg = color, bold = true }
  M["SnacksNotifierFooter" .. level] = { fg = color }
end

return M
