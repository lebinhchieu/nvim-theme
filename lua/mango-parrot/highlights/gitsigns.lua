-- gitsigns.nvim highlight groups (lua/gitsigns/highlight.lua upstream).
-- Colors mirror the source VS Code gitDecoration.*/editorGutter.* roles.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

local kinds = {
  Add = p.diff.add,
  Change = p.diff.change,
  Delete = p.diff.delete,
  Changedelete = p.diff.change,
  Topdelete = p.diff.delete,
  Untracked = p.diff.add,
}

local M = {}

for kind, color in pairs(kinds) do
  M["GitSigns" .. kind] = { fg = color }
  M["GitSigns" .. kind .. "Nr"] = { fg = color }
  M["GitSigns" .. kind .. "Ln"] = { bg = blend(color, 12, p.base.bg) }
  M["GitSigns" .. kind .. "Cul"] = { bg = blend(color, 18, p.base.bg_highlight) }
  M["GitSignsStaged" .. kind] = { fg = color, italic = true }
  M["GitSigns" .. kind .. "Preview"] = { fg = color, bg = blend(color, 15, p.base.bg_dim) }
  M["GitSigns" .. kind .. "Inline"] = { bg = blend(color, 20, p.base.bg) }
  M["GitSigns" .. kind .. "LnInline"] = { bg = blend(color, 20, p.base.bg) }
end

M.GitSignsNoEOLPreview = { fg = p.diagnostic.error, bg = blend(p.diagnostic.error, 15, p.base.bg_dim) }
M.GitSignsCurrentLineBlame = { fg = p.base.fg_muted, italic = true }
M.GitSignsVirtLnum = { fg = p.base.fg_faint }

return M
