-- lazy.nvim's plugin-manager UI (lua/lazy/view/colors.lua upstream).
--
-- Upstream's defaults are links into generic groups, which mostly survive, but
-- two land badly here: `LazyButton` links to `CursorLine` and `LazyButtonActive`
-- to `Visual`, and on a cream background that makes the tab bar across the top
-- of `:Lazy` nearly invisible. The rest is declared alongside them so the whole
-- window is one decision.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

return {
  LazyNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  LazyH1 = { fg = p.base.fg, bg = p.accent.orange_bright, bold = true },
  LazyH2 = { fg = p.accent.orange, bold = true },
  LazyComment = { fg = p.base.fg_muted, italic = true },
  LazyDimmed = { fg = p.base.fg_dim },
  LazyProp = { fg = p.base.fg_dim },
  LazyValue = { fg = p.accent.string },
  LazyLocal = { fg = p.accent.number },
  LazyNoCond = { fg = p.diagnostic.warn },
  LazySpecial = { fg = p.accent.string_escape },
  LazyDir = { fg = p.accent.type, underline = true },
  LazyUrl = { fg = p.accent.type, underline = true },
  LazyTaskOutput = { fg = p.base.fg },
  LazyError = { fg = p.diagnostic.error },
  LazyWarning = { fg = p.diagnostic.warn },
  LazyInfo = { fg = p.diagnostic.info },
  LazyBold = { bold = true },
  LazyItalic = { italic = true },

  -- Tab bar. Inactive tabs sit on the deepest chrome tone; the active one gets
  -- the brand tint plus bold, the same pairing PmenuSel and BlinkCmpMenuSelection
  -- use for "this is the current row".
  LazyButton = { fg = p.base.fg_muted, bg = p.base.bg_alt },
  LazyButtonActive = { fg = p.base.fg, bg = blend(p.accent.orange_bright, 30, p.base.bg_dim), bold = true },

  LazyProgressDone = { fg = p.accent.orange_bright, bold = true },
  LazyProgressTodo = { fg = p.base.guide },

  LazyCommit = { fg = p.accent.string_escape },
  LazyCommitIssue = { fg = p.accent.number },
  LazyCommitType = { fg = p.accent.orange, bold = true },
  LazyCommitScope = { fg = p.base.fg_muted, italic = true },

  -- Why a plugin loaded, shown as `event`/`ft`/`keys`/... chips. Each reuses
  -- the accent its concept already has elsewhere in the theme.
  LazyReasonEvent = { fg = p.accent.number },
  LazyReasonKeys = { fg = p.accent.keyword },
  LazyReasonPlugin = { fg = p.accent.string_escape },
  LazyReasonRuntime = { fg = p.accent.string_escape },
  LazyReasonSource = { fg = p.accent.string },
  LazyReasonFt = { fg = p.accent.string },
  LazyReasonCmd = { fg = p.accent.operator },
  LazyReasonStart = { fg = p.accent.property },
  LazyReasonImport = { fg = p.base.fg },
  LazyReasonRequire = { fg = p.accent.property },
}
