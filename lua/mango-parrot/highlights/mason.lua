-- mason.nvim's package-manager UI (lua/mason-core/ui upstream).
--
-- Mason ships no default links at all, so an unthemed `:Mason` falls back to
-- whatever the base groups happen to be. Its `*Block` groups are used as
-- filled chips (background carries the meaning), the plain ones as text.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

return {
  MasonNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  MasonHeader = { fg = p.base.fg, bg = p.accent.orange_bright, bold = true },
  MasonHeaderSecondary = { fg = p.base.fg, bg = blend(p.accent.orange_bright, 30, p.base.bg_dim), bold = true },
  MasonHeading = { fg = p.accent.orange, bold = true },

  MasonHighlight = { fg = p.accent.type },
  MasonHighlightSecondary = { fg = p.accent.string_escape },
  MasonHighlightBlock = { fg = p.base.bg, bg = p.accent.type },
  MasonHighlightBlockBold = { fg = p.base.bg, bg = p.accent.type, bold = true },
  MasonHighlightBlockSecondary = { fg = p.base.bg, bg = p.accent.string_escape },
  MasonHighlightBlockBoldSecondary = { fg = p.base.bg, bg = p.accent.string_escape, bold = true },

  MasonMuted = { fg = p.base.fg_muted },
  MasonMutedBlock = { fg = p.base.fg, bg = p.base.bg_alt },
  MasonMutedBlockBold = { fg = p.base.fg, bg = p.base.bg_alt, bold = true },

  MasonError = { fg = p.diagnostic.error },
  MasonWarning = { fg = p.diagnostic.warn },
  MasonLink = { fg = p.accent.type, underline = true },
}
