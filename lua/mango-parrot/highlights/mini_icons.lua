-- mini.icons highlight groups -- the fixed 9-color palette icons are
-- categorized into (LazyVim core dependency for devicon-style file/kind
-- icons across the picker, explorer, tabline, and which-key).

local p = require("mango-parrot.palette")

return {
  MiniIconsAzure = { fg = p.accent.type },
  MiniIconsBlue = { fg = p.accent.property },
  MiniIconsCyan = { fg = p.accent.type },
  MiniIconsGreen = { fg = p.accent.string },
  MiniIconsGrey = { fg = p.base.fg_dim },
  MiniIconsOrange = { fg = p.accent.function_ },
  MiniIconsPurple = { fg = p.accent.number },
  MiniIconsRed = { fg = p.accent.operator },
  MiniIconsYellow = { fg = p.accent.string_escape },
}
