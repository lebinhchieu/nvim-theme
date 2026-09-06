-- lualine.nvim theme table. Auto-discovered by lualine when configured with
-- `require('lualine').setup({ options = { theme = 'mango-parrot' } })`.
--
-- Per-mode "a" section fills reuse the palette's saturated accent hues.
-- Text color per fill was picked by measuring WCAG contrast both ways
-- (tests/palette_spec.lua doesn't cover this file, since it's about the
-- fill/text *pairing* rather than a color read against the theme
-- background): light fills (orange, muted) read better with the dark cocoa
-- foreground; darker, more saturated fills (teal, purple, red, green,
-- yellow) read better with the cream foreground.

local p = require("mango-parrot.palette")

local mode = {
  normal = { bg = p.accent.orange_bright, fg = p.base.fg }, -- cocoa-on-orange: 4.26:1
  insert = { bg = p.accent.cyan, fg = p.base.bg }, -- cream-on-teal
  visual = { bg = p.accent.magenta, fg = p.base.bg }, -- cream-on-purple: 4.95:1
  replace = { bg = p.accent.red, fg = p.base.bg }, -- cream-on-red
  command = { bg = p.accent.yellow, fg = p.base.bg }, -- cream-on-yellow
  terminal = { bg = p.accent.green, fg = p.base.bg }, -- cream-on-green
}

local function section(mode_colors)
  return {
    a = { bg = mode_colors.bg, fg = mode_colors.fg, gui = "bold" },
    b = { bg = p.base.bg_alt, fg = p.base.fg },
    c = { bg = p.base.bg_dim, fg = p.base.fg_muted },
  }
end

-- fg_muted (not fg_faint): an inactive split's statusline still shows real
-- information (filename, branch, diagnostics) a user reads at a glance, so
-- it only needs to look de-emphasized, not near-invisible.
local inactive = {
  a = { bg = p.base.bg_dim, fg = p.base.fg_muted },
  b = { bg = p.base.bg_dim, fg = p.base.fg_muted },
  c = { bg = p.base.bg_dim, fg = p.base.fg_muted },
}

return {
  normal = section(mode.normal),
  insert = section(mode.insert),
  visual = section(mode.visual),
  replace = section(mode.replace),
  command = section(mode.command),
  terminal = section(mode.terminal),
  inactive = inactive,
}
