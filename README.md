# 🥭 Mango Parrot (Neovim)

A Neovim port of the [Mango Parrot](https://github.com/lebinhchieu/tropical-sorbet/blob/master/themes/mango-parrot-color-theme.json) VS Code theme — a bright citrus light theme on a `#FCF8F1` cream background. Built for [LazyVim](https://www.lazyvim.org) defaults (Snacks picker/explorer, lualine, bufferline, gitsigns, which-key, noice, trouble, flash, blink.cmp, render-markdown, todo-comments, grug-far) plus the `:Lazy` and `:Mason` UIs.

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

## Configuration

Optional — `:colorscheme mango-parrot` works without ever calling `setup`.

```lua
require("mango-parrot").setup({
  -- Paint Neovide's window title bar to match the theme's chrome, so the OS
  -- frame stops reading as a gray strip bolted onto a cream editor.
  -- No effect outside Neovide.
  neovide = true,

  -- Last word on every highlight group, called with the fully merged table.
  on_highlights = function(hl, palette)
    hl.Comment = { fg = palette.base.fg_muted } -- e.g. drop the italic
  end,
})
```

`on_highlights` is deliberately the only customization hook: it covers every taste toggle a per-option flag could, and also the ones it could not.

## Readability over strict fidelity

Several colors in the source VS Code theme are too low-contrast against the `#FCF8F1` background once read as plain terminal text (VS Code's TextMate renderer is more forgiving than a terminal). Per WCAG 2.1 AA (4.5:1 for text, 3:1 for de-emphasized/decorative elements), these were darkened — same hue, more contrast:

| Role | Source hex | Contrast (source) | Adjusted hex | Contrast (adjusted) |
|---|---|---|---|---|
| Comment | `#AFA48C` | 2.3:1 | `#6C614B` | 5.75:1 |
| Function / method | `#CE7000` | 3.3:1 | `#AD5E00` | 4.5:1 |
| Type / class | `#0C8A80` | 4.0:1 | `#0B7F76` | 4.6:1 |
| String | `#368A1E` | 4.1:1 | `#33821C` | 4.6:1 |
| Operator | `#DB3B22` | 4.3:1 | `#D23921` | 4.6:1 |
| Escape / regexp / warn | `#9E7A00` | 3.8:1 | `#8F6E00` | 4.5:1 |
| ANSI white | `#A99C86` | 2.6:1 | `#6C604D` | 5.8:1 |
| ANSI bright black / green / yellow / blue / magenta / cyan | various | 2.3–4.0:1 | darkened | 4.5–4.6:1 |

Brand orange (`#E8820E`) is kept unchanged as a fill/cursor/border color (never rendered as text on its own); a separate `orange` role (`#AA600A`, 4.5:1) is used wherever orange appears as text (headings, search matches). Where text *is* written on the brand fill — the cursor's glyph, the current search match, a `TODO:` tag — it uses the cocoa foreground (4.26:1), not cream (2.60:1). Enforced by `tests/palette_spec.lua` and `tests/highlight_spec.lua`; the full rationale is in `lua/mango-parrot/palette.lua`.

Comment and ANSI white both clear the 4.5:1 floor on their own, but each was tuned independently of its nearest neighbor (punctuation's `fg_dim`, ANSI bright black) and landed within ~1.03–1.16:1 of it — same gray for two different roles, in a terminal and in a buffer. Comment and ANSI white were darkened further, and `fg_dim` lightened toward its own 3:1 floor, so each pair now sits ≥1.25:1 apart. Enforced by `tests/palette_spec.lua`.

### Depth without shadows

A light theme has no drop shadow to lean on — Neovide's renders as a gray smudge on cream, so it is usually switched off — and the fill difference between the editor (`#FCF8F1`) and a float (`#F6EFE3`) is only 1.08:1. The outline therefore has to carry the separation on its own, which splits the old single border tone in two:

| Role | Hex | Contrast | Used for |
|---|---|---|---|
| `border` | `#C4A778` | 2.01:1 on floats, 2.17:1 on the editor | Outlines of things sitting *on top* — floats, popups, split separators, tabs |
| `guide` | `#E7DBC8` | 1.29:1 | Rules *inside* a surface — indent guides, tree indents, scrollbar gutters |

Applying the border weight to both would draw a cage around every nested block; applying the guide weight to both is what made floats indistinguishable from the buffer. Enforced by `tests/surface_spec.lua`.

A related trap: a title, footer or border group with no `bg` falls back to the *global* `Normal` background rather than the float's own fill, so it renders as a lighter patch on the panel. Plugins that route titles through `winhighlight` (snacks maps `FloatTitle:SnacksTitle`) hit this constantly, so every float-chrome group carries its surface explicitly — enforced by `tests/highlight_spec.lua`.

## Layout

```
colors/mango-parrot.vim        -- thin `:colorscheme` loader
lua/mango-parrot/
  palette.lua                  -- the color table (see above)
  color.lua                    -- alpha-blend helper (flattens VS Code's alpha hexes)
  contrast.lua                 -- WCAG contrast ratio (used by tests)
  kinds.lua                    -- shared LSP/completion "kind" -> color map
  config.lua                   -- user options + defaults
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
