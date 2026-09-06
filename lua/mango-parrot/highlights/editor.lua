-- Core editor/UI highlight groups: window chrome, popups, search, diagnostics,
-- diffs, spelling. No VS Code concept maps 1:1 onto several of these
-- (floats, folds, diagnostics) -- built to reuse the existing accent hues
-- per the grilled hue-reuse decision.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

return {
  -- Base
  Normal = { fg = p.base.fg, bg = p.base.bg },
  NormalNC = { fg = p.base.fg, bg = p.base.bg },
  NormalFloat = { fg = p.base.fg, bg = p.base.bg_dim },
  FloatBorder = { fg = p.base.border, bg = p.base.bg_dim },
  FloatTitle = { fg = p.accent.orange, bg = p.base.bg_dim, bold = true },
  FloatFooter = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  ColorColumn = { bg = p.base.bg_alt },
  Conceal = { fg = p.base.fg_dim },
  Cursor = { fg = p.base.fg, bg = p.accent.orange_bright },
  lCursor = { link = "Cursor" },
  CursorIM = { link = "Cursor" },
  TermCursor = { link = "Cursor" },
  TermCursorNC = { bg = p.base.fg_faint },
  CursorLine = { bg = p.base.bg_highlight },
  CursorColumn = { link = "CursorLine" },
  CursorLineNr = { fg = p.accent.function_, bold = true },
  CursorLineSign = { fg = p.base.fg_faint, bg = p.base.bg_highlight },
  CursorLineFold = { fg = p.base.fg_faint, bg = p.base.bg_highlight },
  LineNr = { fg = p.base.fg_faint },
  SignColumn = { fg = p.base.fg_faint, bg = p.base.bg },
  Directory = { fg = p.accent.function_ },
  EndOfBuffer = { fg = p.base.fg_faint },
  NonText = { fg = p.base.fg_faint },
  Whitespace = { fg = p.base.fg_faint },
  SpecialKey = { fg = p.base.fg_faint },

  -- Selection / search
  Visual = { bg = blend(p.accent.orange_bright, 35, p.base.bg) },
  VisualNOS = { link = "Visual" },
  Search = { bg = blend(p.accent.yellow, 60, p.base.bg), fg = p.base.fg },
  IncSearch = { bg = p.accent.orange_bright, fg = p.base.fg },
  CurSearch = { link = "IncSearch" },
  Substitute = { bg = p.accent.pink, fg = p.base.bg },
  MatchParen = { bg = blend(p.accent.orange_bright, 40, p.base.bg), bold = true },

  -- Popup menu / completion
  Pmenu = { fg = p.base.fg, bg = p.base.bg_dim },
  PmenuSel = { fg = p.base.fg, bg = blend(p.accent.orange_bright, 30, p.base.bg_dim), bold = true },
  PmenuKind = { fg = p.accent.type, bg = p.base.bg_dim },
  PmenuKindSel = { link = "PmenuSel" },
  PmenuExtra = { fg = p.base.fg_dim, bg = p.base.bg_dim },
  PmenuExtraSel = { link = "PmenuSel" },
  PmenuSbar = { bg = p.base.guide },
  PmenuThumb = { bg = p.base.fg_dim },
  WildMenu = { link = "PmenuSel" },

  -- Statusline / tabline / winbar
  StatusLine = { fg = p.base.fg, bg = p.base.bg_alt },
  StatusLineNC = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  WinBar = { fg = p.base.fg, bg = p.base.bg },
  WinBarNC = { fg = p.base.fg_muted, bg = p.base.bg },
  WinSeparator = { fg = p.base.border },
  VertSplit = { link = "WinSeparator" },
  TabLine = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  TabLineFill = { bg = p.base.bg_dim },
  TabLineSel = { fg = p.base.fg, bg = p.base.bg, bold = true },

  -- Folds
  Folded = { fg = p.base.fg_muted, bg = p.base.bg_alt, italic = true },
  FoldColumn = { fg = p.base.fg_faint, bg = p.base.bg },

  -- Messages
  Title = { fg = p.accent.orange, bold = true },
  ModeMsg = { fg = p.base.fg, bold = true },
  MoreMsg = { fg = p.accent.green, bold = true },
  Question = { fg = p.accent.green },
  WarningMsg = { fg = p.diagnostic.warn },
  ErrorMsg = { fg = p.diagnostic.error },
  MsgArea = { fg = p.base.fg, bg = p.base.bg },
  MsgSeparator = { fg = p.base.border, bg = p.base.bg_dim },
  QuickFixLine = { bg = blend(p.accent.orange_bright, 25, p.base.bg) },
  qfFileName = { fg = p.accent.function_ },
  qfLineNr = { fg = p.base.fg_faint },

  -- Diff
  DiffAdd = { fg = p.diff.add, bg = blend(p.diff.add, 18, p.base.bg) },
  DiffChange = { fg = p.diff.change, bg = blend(p.diff.change, 18, p.base.bg) },
  DiffDelete = { fg = p.diff.delete, bg = blend(p.diff.delete, 18, p.base.bg) },
  DiffText = { fg = p.diff.text, bg = blend(p.diff.change, 30, p.base.bg), bold = true },
  -- Neovim ships its own defaults for these three (#005523/#007373/#590008),
  -- and `hi clear` restores rather than removes them -- so leaving them out
  -- doesn't mean "unstyled", it means "dark-theme green, teal and maroon".
  -- Plugins reading them (snacks' undo picker, git status columns) inherit
  -- that, including teal for "changed" where this palette uses yellow.
  Added = { fg = p.diff.add },
  Changed = { fg = p.diff.change },
  Removed = { fg = p.diff.delete },

  -- Spelling
  SpellBad = { sp = p.diagnostic.error, undercurl = true },
  SpellCap = { sp = p.diagnostic.info, undercurl = true },
  SpellLocal = { sp = p.diagnostic.hint, undercurl = true },
  SpellRare = { sp = p.accent.magenta, undercurl = true },

  -- Diagnostics (invented mapping onto existing accent hues)
  DiagnosticError = { fg = p.diagnostic.error },
  DiagnosticWarn = { fg = p.diagnostic.warn },
  DiagnosticInfo = { fg = p.diagnostic.info },
  DiagnosticHint = { fg = p.diagnostic.hint },
  DiagnosticOk = { fg = p.diagnostic.ok },
  DiagnosticUnderlineError = { sp = p.diagnostic.error, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.diagnostic.warn, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.diagnostic.info, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.diagnostic.hint, undercurl = true },
  DiagnosticUnderlineOk = { sp = p.diagnostic.ok, undercurl = true },
  DiagnosticVirtualTextError = { fg = p.diagnostic.error, bg = blend(p.diagnostic.error, 12, p.base.bg) },
  DiagnosticVirtualTextWarn = { fg = p.diagnostic.warn, bg = blend(p.diagnostic.warn, 12, p.base.bg) },
  DiagnosticVirtualTextInfo = { fg = p.diagnostic.info, bg = blend(p.diagnostic.info, 12, p.base.bg) },
  DiagnosticVirtualTextHint = { fg = p.diagnostic.hint, bg = blend(p.diagnostic.hint, 12, p.base.bg) },
  DiagnosticVirtualTextOk = { fg = p.diagnostic.ok, bg = blend(p.diagnostic.ok, 12, p.base.bg) },
  -- Applied over the token's own syntax color, so this is what unused imports
  -- and dead locals actually look like. Dimmer than a comment and italic, to
  -- read as "inert" without being mistaken for one.
  DiagnosticUnnecessary = { fg = p.base.fg_dim, italic = true },
  DiagnosticDeprecated = { sp = p.diagnostic.warn, strikethrough = true },
  DiagnosticSignError = { fg = p.diagnostic.error },
  DiagnosticSignWarn = { fg = p.diagnostic.warn },
  DiagnosticSignInfo = { fg = p.diagnostic.info },
  DiagnosticSignHint = { fg = p.diagnostic.hint },
  DiagnosticSignOk = { fg = p.diagnostic.ok },
  DiagnosticFloatingError = { fg = p.diagnostic.error, bg = p.base.bg_dim },
  DiagnosticFloatingWarn = { fg = p.diagnostic.warn, bg = p.base.bg_dim },
  DiagnosticFloatingInfo = { fg = p.diagnostic.info, bg = p.base.bg_dim },
  DiagnosticFloatingHint = { fg = p.diagnostic.hint, bg = p.base.bg_dim },
  DiagnosticFloatingOk = { fg = p.diagnostic.ok, bg = p.base.bg_dim },

  -- LSP references / signature help / inlay hints / codelens
  LspReferenceText = { bg = p.base.bg_alt },
  LspReferenceRead = { bg = p.base.bg_alt },
  LspReferenceWrite = { bg = p.base.bg_alt, underline = true },
  LspReferenceTarget = { bg = p.base.bg_alt },
  LspSignatureActiveParameter = { bg = blend(p.accent.orange_bright, 30, p.base.bg), bold = true },
  LspCodeLens = { fg = p.base.fg_muted, italic = true },
  LspCodeLensSeparator = { fg = p.base.fg_faint },
  LspInlayHint = { fg = p.base.fg_faint, bg = p.base.bg_alt, italic = true },

  -- Misc
  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },
  Todo = { fg = p.base.fg, bg = p.accent.orange_bright, bold = true },
  Error = { fg = p.diagnostic.error, bold = true },
  debugPC = { bg = blend(p.diagnostic.info, 18, p.base.bg) },
  debugBreakpoint = { fg = p.diagnostic.error, bg = p.base.bg },

  -- :checkhealth
  healthError = { fg = p.diagnostic.error },
  healthWarning = { fg = p.diagnostic.warn },
  healthSuccess = { fg = p.diagnostic.ok },
  healthHelp = { fg = p.accent.type, underline = true },
}
