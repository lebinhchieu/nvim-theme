# 🥭 Mango Parrot (Neovim)

A Neovim port of the [Mango Parrot](https://github.com/lebinhchieu/tropical-sorbet/blob/master/themes/mango-parrot-color-theme.json) VS Code theme — a bright citrus light theme on a `#FCF8F1` cream background. Built for [LazyVim](https://www.lazyvim.org) defaults (Snacks picker/explorer, lualine, bufferline, gitsigns, which-key, noice, trouble, flash, blink.cmp).

## Install (lazy.nvim / LazyVim)

```lua
{
  dir = "~/workspace/nvim-theme", -- adjust to wherever you clone this repo
  name = "mango-parrot",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("mango-parrot")
  end,
}
```

To use it as your lualine theme too:

```lua
require("lualine").setup({ options = { theme = "mango-parrot" } })
```

## Readability over strict fidelity

Several colors in the source VS Code theme are too low-contrast against the `#FCF8F1` background once read as plain terminal text (VS Code's TextMate renderer is more forgiving than a terminal). Per WCAG 2.1 AA (4.5:1 for text, 3:1 for de-emphasized/decorative elements), these were darkened — same hue, more contrast:

| Role | Source hex | Contrast (source) | Adjusted hex | Contrast (adjusted) |
|---|---|---|---|---|
| Comment | `#AFA48C` | 2.3:1 | `#7C7056` | 4.6:1 |
| Function / method | `#CE7000` | 3.3:1 | `#AD5E00` | 4.5:1 |
| Type / class | `#0C8A80` | 4.0:1 | `#0B7F76` | 4.6:1 |
| String | `#368A1E` | 4.1:1 | `#33821C` | 4.6:1 |
| Operator | `#DB3B22` | 4.3:1 | `#D23921` | 4.6:1 |
| Escape / regexp / warn | `#9E7A00` | 3.8:1 | `#8F6E00` | 4.5:1 |
| ANSI white / bright black / bright green / bright yellow / bright blue / bright magenta / bright cyan | various | 2.3–4.0:1 | darkened | 4.5–4.6:1 |

Brand orange (`#E8820E`) is kept unchanged as a fill/cursor/border color (never rendered as text on its own); a separate `orange` role (`#AA600A`, 4.5:1) is used wherever orange appears as text (headings, search matches). Enforced by `tests/palette_spec.lua`; the full rationale is in `lua/mango-parrot/palette.lua`.

## Layout

```
colors/mango-parrot.vim        -- thin `:colorscheme` loader
lua/mango-parrot/
  palette.lua                  -- the color table (see above)
  color.lua                    -- alpha-blend helper (flattens VS Code's alpha hexes)
  contrast.lua                 -- WCAG contrast ratio (used by tests)
  kinds.lua                    -- shared LSP/completion "kind" -> color map
  init.lua                     -- setup/load
  highlights/                  -- one module per plugin/subsystem, merged by highlights/init.lua
lua/lualine/themes/mango-parrot.lua
tests/                         -- run with `nvim -l tests/run_tests.lua`
```

## Testing

```bash
nvim -l tests/run_tests.lua                              # palette/contrast unit tests
nvim --headless -u NONE --cmd "set rtp+=." -c "colorscheme mango-parrot" -c "qa!"  # smoke test
```
