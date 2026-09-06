-- flash.nvim highlight groups (lua/flash/highlight.lua upstream).

local p = require("mango-parrot.palette")

return {
  FlashBackdrop = { fg = p.base.fg_faint },
  FlashMatch = { fg = p.base.bg, bg = p.accent.type, bold = true },
  FlashCurrent = { fg = p.base.bg, bg = p.accent.orange_bright, bold = true },
  FlashLabel = { fg = p.base.bg, bg = p.accent.keyword, bold = true },
  FlashPrompt = { fg = p.base.fg, bg = p.base.bg_dim },
  FlashPromptIcon = { fg = p.accent.orange },
  FlashCursor = { link = "Cursor" },
}
