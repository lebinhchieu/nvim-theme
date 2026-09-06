-- Mango Parrot (light) -- Neovim port of the Mango Parrot VS Code theme.
-- See neovim/README.md for install instructions and the palette rationale.

local M = {}

--- Loads the colorscheme: clears existing highlights, sets background/
--- termguicolors, applies every highlight group, and sets the terminal
--- ANSI colors.
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "light"
  vim.g.colors_name = "mango-parrot"

  require("mango-parrot.highlights").apply(0)

  local palette = require("mango-parrot.palette")
  local ansi = {
    palette.ansi.normal.black,
    palette.ansi.normal.red,
    palette.ansi.normal.green,
    palette.ansi.normal.yellow,
    palette.ansi.normal.blue,
    palette.ansi.normal.magenta,
    palette.ansi.normal.cyan,
    palette.ansi.normal.white,
    palette.ansi.bright.black,
    palette.ansi.bright.red,
    palette.ansi.bright.green,
    palette.ansi.bright.yellow,
    palette.ansi.bright.blue,
    palette.ansi.bright.magenta,
    palette.ansi.bright.cyan,
    palette.ansi.bright.white,
  }
  for i, hex in ipairs(ansi) do
    vim.g["terminal_color_" .. (i - 1)] = hex
  end
end

return M
