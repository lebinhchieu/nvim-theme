-- trouble.nvim highlight groups (lua/trouble/config/highlights.lua upstream).

local p = require("mango-parrot.palette")
local kinds = require("mango-parrot.kinds")
local blend = require("mango-parrot.color").blend

local M = {
  TroubleNormal = { fg = p.base.fg, bg = p.base.bg_dim },
  TroubleNormalNC = { fg = p.base.fg_muted, bg = p.base.bg_dim },
  TroubleText = { fg = p.base.fg },
  TroublePreview = { bg = blend(p.accent.orange_bright, 20, p.base.bg_dim) },
  TroubleFilename = { fg = p.accent.function_, italic = true },
  TroubleBasename = { fg = p.accent.function_, bold = true },
  TroubleDirectory = { fg = p.base.fg_muted },
  TroubleIconDirectory = { fg = p.accent.function_ },
  TroubleSource = { fg = p.base.fg_faint },
  TroubleCode = { fg = p.base.fg_dim },
  TroublePos = { fg = p.base.fg_faint },
  TroubleCount = { fg = p.base.fg, bg = p.accent.orange_bright, bold = true },
  TroubleIndent = { fg = p.base.guide },
  TroubleIndentFoldClosed = { fg = p.base.fg_dim },
  TroubleIndentFoldOpen = { fg = p.base.fg_dim },
  TroubleIndentTop = { fg = p.base.guide },
  TroubleIndentMiddle = { fg = p.base.guide },
  TroubleIndentLast = { fg = p.base.guide },
  TroubleIndentWs = { fg = p.base.guide },
  TroubleFsFilename = { link = "TroubleFilename" },
}

for kind, color in pairs(kinds) do
  M["TroubleIcon" .. kind] = { fg = color }
end

return M
