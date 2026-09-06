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
  -- Everything from here to SnacksWinKeyDesc is drawn in a float's BORDER row,
  -- not its body: snacks maps `FloatTitle:SnacksTitle,FloatFooter:SnacksFooter`
  -- through `winhighlight`. A border-row group with no `bg` falls back to the
  -- global `Normal` background rather than the float's own fill, which paints
  -- the title as a lighter patch on top of the panel tone. So these all carry
  -- the float surface explicitly.
  SnacksTitle = { fg = p.accent.orange, bg = p.base.bg_dim, bold = true },
  SnacksFooter = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  SnacksFooterDesc = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  SnacksFooterKey = { fg = p.accent.function_, bg = p.base.bg_dim, bold = true },
  SnacksWinBar = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksWinBarNC = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  SnacksWinSeparator = { fg = p.base.border, bg = p.base.bg_dim },
  SnacksWinKey = { fg = p.accent.function_, bg = p.base.bg_dim, bold = true },
  SnacksWinKeySep = { fg = p.base.fg_faint, bg = p.base.bg_dim },
  SnacksWinKeyDesc = { fg = p.base.fg_muted, bg = p.base.bg_dim },

  -- Indent guides
  SnacksIndent = { fg = p.base.guide },
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
  SnacksNotifierHistoryTitle = { fg = p.accent.orange, bg = p.base.bg_dim, bold = true },
  SnacksNotifierHistoryDateTime = { fg = p.base.fg_faint },
  SnacksNotifierMinimal = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksNotifierHistory = { fg = p.base.fg, bg = p.base.bg_dim },

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
  SnacksPickerToggle = { fg = p.base.fg, bg = p.accent.orange_bright },
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
  -- Horizontal rule between picker sections. Upstream links it to
  -- `@punctuation.special.markdown`, which paints it yellow.
  SnacksPickerRule = { fg = p.base.guide },

  -- vim.ui.input -- LSP rename and anything else routed through it. Upstream
  -- links the border and title to DiagnosticInfo, making this the only blue
  -- float in a cream-and-orange theme.
  SnacksInput = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksInputNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksInputBorder = { fg = p.base.border, bg = p.base.bg_dim },
  SnacksInputTitle = { fg = p.accent.orange, bg = p.base.bg_dim, bold = true },
  SnacksInputIcon = { fg = p.accent.orange },
  SnacksInputPrompt = { fg = p.accent.keyword },

  -- Zen mode and `Snacks.dim`. Upstream links SnacksDim to
  -- DiagnosticUnnecessary, which this theme italicizes -- correct for a dead
  -- symbol, wrong here, where it covers every line outside the active scope.
  SnacksDim = { fg = p.base.fg_dim },
  SnacksZen = { fg = p.base.fg, bg = p.base.bg },
  SnacksZenIcon = { fg = p.accent.orange },
  SnacksScratch = { fg = p.base.fg, bg = p.base.bg_dim },
  SnacksScratchTitle = { fg = p.accent.orange, bg = p.base.bg_dim, bold = true },
  SnacksIndentUnderline = { fg = p.base.guide },
  SnacksBadge = { fg = p.base.fg, bg = p.accent.orange_bright, bold = true },

  -- Git diff preview inside the picker
  SnacksDiffAdd = { fg = p.diff.add, bg = blend(p.diff.add, 15, p.base.bg_dim) },
  SnacksDiffDelete = { fg = p.diff.delete, bg = blend(p.diff.delete, 15, p.base.bg_dim) },
  SnacksDiffContext = { fg = p.base.fg_muted },
  SnacksDiffConflict = { fg = p.base.fg, bg = blend(p.diagnostic.error, 20, p.base.bg_dim), bold = true },
  SnacksDiffHeader = { fg = p.accent.orange, bold = true },
  SnacksDiffLabel = { fg = p.base.fg_muted, italic = true },

  -- Inline images (markdown previews)
  SnacksImage = { fg = p.base.fg },
  SnacksImageAnchor = { fg = p.base.fg_faint },
  SnacksImageLoading = { fg = p.base.fg_muted, italic = true },
  SnacksImageMath = { fg = p.accent.number },
  SnacksImageSpinner = { fg = p.accent.orange },

  -- Profiler
  SnacksProfilerHot = { fg = p.diagnostic.error, bold = true },
  SnacksProfilerLoaded = { fg = p.accent.string },
  SnacksProfilerStarted = { fg = p.accent.string },
  SnacksProfilerStopped = { fg = p.diagnostic.error },
  SnacksProfilerIcon = { fg = p.accent.orange },
  SnacksProfilerIconInfo = { fg = p.diagnostic.info },
  SnacksProfilerIconTrace = { fg = p.base.fg_muted },
  SnacksProfilerBadge = { fg = p.base.fg, bg = p.base.bg_alt },
  SnacksProfilerBadgeInfo = { fg = p.diagnostic.info, bg = blend(p.diagnostic.info, 12, p.base.bg) },
  SnacksProfilerBadgeTrace = { fg = p.base.fg_muted, bg = p.base.bg_alt },
}

-- Indent-guide levels 1-8: all on the same subtle border tone. A per-level
-- rainbow was tried and read as visual noise down the tree -- SnacksIndentScope
-- and SnacksIndentChunk already carry the one accent that matters.
for i = 1, 8 do
  M["SnacksIndent" .. i] = { fg = p.base.guide }
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
  -- The body. Upstream links it to `Normal` (editor background); every other
  -- snacks float in this theme sits on the panel tone.
  M["SnacksNotifier" .. level] = { fg = p.base.fg, bg = p.base.bg_dim }
  M["SnacksNotifierIcon" .. level] = { fg = color, bg = p.base.bg_dim }
  M["SnacksNotifierBorder" .. level] = { fg = color, bg = p.base.bg_dim }
  M["SnacksNotifierTitle" .. level] = { fg = color, bg = p.base.bg_dim, bold = true }
  M["SnacksNotifierFooter" .. level] = { fg = color, bg = p.base.bg_dim }
end

return M
