-- which-key.nvim highlight groups (lua/which-key/colors.lua upstream).

local p = require("mango-parrot.palette")

return {
  WhichKey = { fg = p.accent.function_, bold = true },
  WhichKeyGroup = { fg = p.accent.type },
  WhichKeyDesc = { fg = p.base.fg },
  WhichKeySeparator = { fg = p.base.fg_faint },
  WhichKeyNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  WhichKeyTitle = { fg = p.accent.orange, bold = true },
  WhichKeyBorder = { fg = p.base.border, bg = p.base.bg_dim },
  WhichKeyValue = { fg = p.base.fg_muted },
  WhichKeyIcon = { fg = p.accent.function_ },
  -- mini.icons-coupled color groups (which-key links `WhichKeyIcon<Color>`
  -- to `MiniIcons<Color>` when it exists; declared explicitly for clarity).
  WhichKeyIconAzure = { link = "MiniIconsAzure" },
  WhichKeyIconBlue = { link = "MiniIconsBlue" },
  WhichKeyIconCyan = { link = "MiniIconsCyan" },
  WhichKeyIconGreen = { link = "MiniIconsGreen" },
  WhichKeyIconGrey = { link = "MiniIconsGrey" },
  WhichKeyIconOrange = { link = "MiniIconsOrange" },
  WhichKeyIconPurple = { link = "MiniIconsPurple" },
  WhichKeyIconRed = { link = "MiniIconsRed" },
  WhichKeyIconYellow = { link = "MiniIconsYellow" },
}
