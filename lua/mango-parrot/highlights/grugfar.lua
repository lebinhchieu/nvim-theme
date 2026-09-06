-- grug-far.nvim's search-and-replace buffer (LazyVim's `<leader>sr`).
--
-- The results view is a diff in disguise: each match shows the old line and
-- the new one, so the add/remove/change indicators and the inline match
-- highlights reuse the theme's diff palette rather than inventing a second
-- vocabulary for the same idea.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

return {
  -- Input fields at the top of the buffer
  GrugFarInputLabel = { fg = p.accent.orange, bold = true },
  GrugFarInputPlaceholder = { fg = p.base.fg_faint, italic = true },

  -- Help / keybinding legend
  GrugFarHelpHeader = { fg = p.accent.orange, bold = true },
  GrugFarHelpHeaderKey = { fg = p.accent.function_, bold = true },
  GrugFarHelpWinHeader = { fg = p.accent.orange, bold = true },
  GrugFarHelpWinActionKey = { fg = p.accent.function_, bold = true },
  GrugFarHelpWinActionPrefix = { fg = p.base.fg_dim },
  GrugFarHelpWinActionDescription = { fg = p.base.fg },
  GrugFarHelpWinActionText = { fg = p.base.fg_muted },

  -- Results header / stats
  GrugFarResultsHeader = { fg = p.accent.orange, bold = true },
  GrugFarResultsStats = { fg = p.base.fg_muted, italic = true },
  GrugFarResultsActionMessage = { fg = p.diagnostic.info },
  GrugFarResultsCmdHeader = { fg = p.base.fg_muted, italic = true },
  GrugFarResultsPath = { fg = p.accent.function_, bold = true },
  GrugFarResultsLongLineStr = { fg = p.base.fg_faint, italic = true },

  -- Line/column gutter
  GrugFarResultsLineNr = { fg = p.base.fg_faint },
  GrugFarResultsColumnNr = { fg = p.base.fg_faint },
  GrugFarResultsNumberLabel = { fg = p.base.fg_dim },
  GrugFarResultsNumbersSeparator = { fg = p.base.guide },
  GrugFarResultsCursorLineNo = { bg = p.base.bg_highlight },

  -- Diff indicators in the results list
  GrugFarResultsAddIndicator = { fg = p.diff.add },
  GrugFarResultsRemoveIndicator = { fg = p.diff.delete },
  GrugFarResultsChangeIndicator = { fg = p.diff.change },
  GrugFarResultsDiffSeparatorIndicator = { fg = p.base.guide },
  GrugFarResultsMatchAdded = { fg = p.diff.add, bg = blend(p.diff.add, 20, p.base.bg) },
  GrugFarResultsMatchRemoved = { fg = p.diff.delete, bg = blend(p.diff.delete, 20, p.base.bg) },

  -- The matched substring itself, and the one under the cursor
  GrugFarResultsMatch = { bg = blend(p.accent.yellow, 60, p.base.bg), fg = p.base.fg },
  GrugFarCurrentMatch = { bg = p.accent.orange_bright, fg = p.base.fg },
  GrugFarVisualBufrange = { bg = blend(p.accent.orange_bright, 35, p.base.bg) },
  GrugFarWithin = { bg = blend(p.accent.orange_bright, 20, p.base.bg) },
}
