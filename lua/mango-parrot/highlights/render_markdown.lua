-- render-markdown.nvim highlight groups
-- (lua/render-markdown/core/colors.lua upstream).
--
-- Worth theming explicitly rather than leaving to upstream's defaults: those
-- link the six heading backgrounds to `DiffText`/`DiffAdd`/`DiffChange`/
-- `DiffDelete`/`Visual`/`CursorColumn`, so an unthemed markdown buffer renders
-- H2 on a green bar and H4 on a red one -- every heading reads as a git hunk.
--
-- Heading foregrounds are the same six accents `@markup.heading.1-6` already
-- uses (syntax.lua), and each bar is that heading's own accent blended into
-- the background, so the ramp is one decision rather than twelve.

local p = require("mango-parrot.palette")
local blend = require("mango-parrot.color").blend

-- How strongly each bar is tinted. Capped by the fact that a bar is a tint of
-- the very accent written on top of it, so every point of tint costs contrast:
-- at 14% the weakest pair (H6) falls to 3.77:1, at 9% the worst is 4.03:1.
-- 4.0 is the floor this repo already holds for bold display text (see
-- tests/lualine_spec.lua) -- headings are glanced, not read as prose, so
-- WCAG's 4.5:1 body-text rule is the wrong one, but 3:1 large-text AA is
-- looser than anything else here. Enforced by tests/markdown_spec.lua.
--
-- Raise it if you want heavier bands and can live with less legible headings:
--   require("mango-parrot").setup({ on_highlights = function(hl, p) ... end })
local BAR_ALPHA = 9

local headings = {
  p.accent.orange,
  p.accent.type,
  p.accent.keyword,
  p.accent.string_escape,
  p.accent.number,
  p.accent.function_,
}

local M = {
  -- Code blocks. The block sits on the panel tone (the same surface floats
  -- use) with a deeper rule above and below, so fenced code reads as an
  -- inset slab rather than a background-colored paragraph.
  RenderMarkdownCode = { bg = p.base.bg_dim },
  RenderMarkdownCodeBorder = { fg = p.base.guide, bg = p.base.bg_alt },
  RenderMarkdownCodeFallback = { fg = p.base.fg, bg = p.base.bg_dim },
  RenderMarkdownCodeInfo = { fg = p.base.fg_muted, italic = true },
  RenderMarkdownCodeInline = { fg = p.accent.type, bg = p.base.bg_alt },
  RenderMarkdownInlineHighlight = { fg = p.accent.type, bg = p.base.bg_alt },

  -- Structure
  RenderMarkdownBullet = { fg = p.accent.orange },
  RenderMarkdownDash = { fg = p.base.guide },
  RenderMarkdownSign = { fg = p.base.fg_faint, bg = p.base.bg },
  RenderMarkdownIndent = { fg = p.base.guide },
  RenderMarkdownMath = { fg = p.accent.number },
  RenderMarkdownHtmlComment = { fg = p.base.fg_muted, italic = true },

  -- Links
  RenderMarkdownLink = { fg = p.accent.type, underline = true },
  RenderMarkdownLinkTitle = { fg = p.accent.type },
  RenderMarkdownWikiLink = { fg = p.accent.type, underline = true },

  -- Checkboxes
  RenderMarkdownUnchecked = { fg = p.base.fg_dim },
  RenderMarkdownChecked = { fg = p.accent.string },
  RenderMarkdownTodo = { fg = p.accent.string_escape },

  -- Tables
  RenderMarkdownTableHead = { fg = p.accent.orange, bold = true },
  RenderMarkdownTableRow = { fg = p.base.fg_muted },

  -- Callouts (> [!NOTE] and friends)
  RenderMarkdownSuccess = { fg = p.diagnostic.ok },
  RenderMarkdownInfo = { fg = p.diagnostic.info },
  RenderMarkdownHint = { fg = p.diagnostic.hint },
  RenderMarkdownWarn = { fg = p.diagnostic.warn },
  RenderMarkdownError = { fg = p.diagnostic.error },
}

for level, color in ipairs(headings) do
  M["RenderMarkdownH" .. level] = { fg = color, bold = true }
  M["RenderMarkdownH" .. level .. "Bg"] = { fg = color, bg = blend(color, BAR_ALPHA, p.base.bg), bold = true }
end

-- Nested block quotes reuse the heading ramp, so quote depth and heading depth
-- speak the same color language instead of inventing a second one.
M.RenderMarkdownQuote = { fg = p.base.fg_muted, italic = true }
for level, color in ipairs(headings) do
  M["RenderMarkdownQuote" .. level] = { fg = color }
end

return M
