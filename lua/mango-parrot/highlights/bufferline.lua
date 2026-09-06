-- bufferline.nvim highlight groups (lua/bufferline/config.lua upstream).
-- Mirrors the source VS Code tab.*/editorGroupHeader.* roles.

local p = require("mango-parrot.palette")

local function tab(bg, fg, opts)
  return vim.tbl_extend("force", { bg = bg, fg = fg or p.base.fg }, opts or {})
end

-- Every buffer-state indicator (Modified, plus the four diagnostic
-- severities) follows the same base/Visible/Selected triple, so it's
-- generated from one table instead of by hand.
local states = {
  Modified = p.diagnostic.warn,
  HintDiagnostic = p.diagnostic.hint,
  InfoDiagnostic = p.diagnostic.info,
  WarningDiagnostic = p.diagnostic.warn,
  ErrorDiagnostic = p.diagnostic.error,
}

local M = {
  BufferLineFill = { bg = p.base.bg_dim },
  BufferLineBackground = tab(p.base.bg_dim, p.base.fg_muted),
  BufferLineTabSelected = tab(p.base.bg, p.base.fg, { bold = true }),
  BufferLineBufferSelected = tab(p.base.bg, p.base.fg, { bold = true }),
  BufferLineBufferVisible = tab(p.base.bg_dim, p.base.fg_muted),

  BufferLineCloseButton = tab(p.base.bg_dim, p.base.fg_dim),
  BufferLineCloseButtonVisible = tab(p.base.bg_dim, p.base.fg_dim),
  BufferLineCloseButtonSelected = tab(p.base.bg, p.diagnostic.error),

  BufferLineNumbers = tab(p.base.bg_dim, p.base.fg_faint),
  BufferLineNumbersVisible = tab(p.base.bg_dim, p.base.fg_faint),
  BufferLineNumbersSelected = tab(p.base.bg, p.base.fg),

  BufferLineGroupSeparator = { fg = p.base.border, bg = p.base.bg_dim },
  BufferLineIndicatorSelected = { fg = p.accent.orange_bright, bg = p.base.bg },
  BufferLineSeparator = { fg = p.base.border, bg = p.base.bg_dim },
  BufferLineSeparatorVisible = { fg = p.base.border, bg = p.base.bg_dim },
  BufferLineSeparatorSelected = { fg = p.base.border, bg = p.base.bg },
}

for state, color in pairs(states) do
  M["BufferLine" .. state] = tab(p.base.bg_dim, color)
  M["BufferLine" .. state .. "Visible"] = tab(p.base.bg_dim, color)
  M["BufferLine" .. state .. "Selected"] = tab(p.base.bg, color)
end

return M
