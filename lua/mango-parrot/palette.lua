-- Mango Parrot (light) palette, ported from the VS Code source theme at
-- themes/mango-parrot-color-theme.json.
--
-- A handful of the source hexes are too low-contrast against the `#FCF8F1`
-- background once read as plain terminal text rather than rendered through
-- VS Code's TextMate engine (comments, functions, types, strings, operators,
-- escapes, and several ANSI colors all fell below WCAG AA's 4.5:1 floor for
-- text). Those roles are darkened here just enough to clear 4.5:1, keeping
-- hue and saturation intact -- see tests/palette_spec.lua for the enforced
-- floors and neovim/README.md for the full before/after table.

local M = {}

M.base = {
  bg = "#FCF8F1", -- editor.background
  bg_dim = "#F6EFE3", -- sideBar/panel background
  bg_alt = "#F0E6D6", -- activityBar/titleBar background
  bg_highlight = "#F4ECDD", -- editor.lineHighlightBackground (CursorLine)
  border = "#E7DBC8", -- panel/editorWidget/tab borders
  fg = "#3E372E", -- editor.foreground
  fg_dim = "#857A68", -- punctuation, secondary UI labels (decorative floor)
  fg_muted = "#7C7056", -- comments; darkened from source #AFA48C/#A99C86 (2.3:1 -> 4.6:1)
  fg_faint = "#C8BBA4", -- inactive line numbers, whitespace, placeholders (intentionally faint)
}

M.accent = {
  pink = "#CE1D6C", -- keyword / storage / control
  green = "#33821C", -- string; darkened from #368A1E (4.1:1 -> 4.6:1)
  yellow = "#8F6E00", -- string escape / regexp / warn; darkened from #9E7A00 (3.8:1 -> 4.5:1)
  magenta = "#9A40CF", -- number / constant / boolean
  cyan = "#0B7F76", -- type / class / interface; darkened from #0C8A80 (4.0:1 -> 4.6:1)
  function_ = "#AD5E00", -- function / method; darkened from #CE7000 (3.3:1 -> 4.5:1)
  blue = "#2A6DC0", -- property
  red = "#D23921", -- operator; darkened from #DB3B22 (4.3:1 -> 4.6:1)
  orange = "#AA600A", -- brand orange used AS TEXT (headings, search matches); darkened from #E8820E (2.6:1 -> 4.5:1)
  orange_bright = "#E8820E", -- brand orange used as a FILL/cursor/border color only; not text-safe on its own
}

-- Semantic aliases, defined by reference so they can never drift from the
-- canonical values above.
M.accent.keyword = M.accent.pink
M.accent.string = M.accent.green
M.accent.string_escape = M.accent.yellow
M.accent.number = M.accent.magenta
M.accent.type = M.accent.cyan
M.accent.operator = M.accent.red
M.accent.property = M.accent.blue

M.diagnostic = {
  error = M.accent.red,
  warn = M.accent.yellow,
  info = M.accent.blue,
  hint = M.accent.cyan,
  ok = M.accent.green,
}

M.diff = {
  add = M.accent.green,
  change = M.accent.yellow,
  delete = M.accent.red,
  rename = M.accent.cyan,
  text = M.accent.orange,
}

M.ansi = {
  normal = {
    black = M.base.fg,
    red = M.accent.red,
    green = M.accent.green,
    yellow = M.accent.yellow,
    blue = M.accent.blue,
    magenta = M.accent.magenta,
    cyan = M.accent.cyan,
    white = "#7C6E58", -- darkened from source #A99C86 (2.6:1 -> 4.6:1)
  },
  bright = {
    black = "#7B7160", -- darkened from source #857A68 (4.0:1 -> 4.6:1)
    red = M.accent.pink,
    green = "#44802A", -- darkened from source #5DAF3A (2.6:1 -> 4.6:1)
    yellow = "#8B6F16", -- darkened from source #C9A020 (2.3:1 -> 4.5:1)
    blue = "#2372CE", -- darkened from source #4A8FE0 (3.2:1 -> 4.6:1)
    magenta = "#A63DE2", -- darkened from source #B966E8 (3.2:1 -> 4.5:1)
    cyan = "#217E7E", -- darkened from source #2CAAAA (2.7:1 -> 4.6:1)
    -- bright white intentionally left near-background: standard convention
    -- for light terminal themes, where it's a 256-color anchor rather than
    -- a color programs render sustained text in.
    white = M.base.bg,
  },
}

return M
