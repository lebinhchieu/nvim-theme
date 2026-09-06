-- Classic :syntax groups + Treesitter @-capture groups, mapped from the
-- source VS Code tokenColors (themes/mango-parrot-color-theme.json).

local p = require("mango-parrot.palette")

local M = {
  -- Classic :syntax groups
  Comment = { fg = p.base.fg_muted, italic = true },
  Constant = { fg = p.accent.number },
  String = { fg = p.accent.string },
  Character = { fg = p.accent.string },
  Number = { fg = p.accent.number },
  Boolean = { fg = p.accent.number },
  Float = { fg = p.accent.number },
  Identifier = { fg = p.base.fg },
  Function = { fg = p.accent.function_ },
  Statement = { fg = p.accent.keyword },
  Conditional = { fg = p.accent.keyword },
  Repeat = { fg = p.accent.keyword },
  Label = { fg = p.accent.string_escape },
  Operator = { fg = p.accent.operator },
  Keyword = { fg = p.accent.keyword },
  Exception = { fg = p.accent.keyword },
  PreProc = { fg = p.accent.keyword },
  Include = { fg = p.accent.keyword },
  Define = { fg = p.accent.keyword },
  Macro = { fg = p.accent.string_escape },
  PreCondit = { fg = p.accent.keyword },
  Type = { fg = p.accent.type },
  StorageClass = { fg = p.accent.keyword },
  Structure = { fg = p.accent.type },
  Typedef = { fg = p.accent.type },
  Special = { fg = p.accent.string_escape },
  SpecialChar = { fg = p.accent.string_escape },
  Tag = { fg = p.accent.keyword },
  Delimiter = { fg = p.base.fg_dim },
  SpecialComment = { fg = p.base.fg_muted, italic = true },
  Debug = { fg = p.diagnostic.error },
  Ignore = { fg = p.base.fg_faint },

  -- Treesitter: variables / values
  ["@variable"] = { fg = p.base.fg },
  ["@variable.builtin"] = { fg = p.accent.keyword, italic = true },
  ["@variable.parameter"] = { fg = p.base.fg, italic = true },
  ["@variable.parameter.builtin"] = { fg = p.base.fg, italic = true },
  ["@variable.member"] = { fg = p.accent.property },
  ["@constant"] = { fg = p.accent.number },
  ["@constant.builtin"] = { fg = p.accent.number },
  ["@constant.macro"] = { fg = p.accent.string_escape },
  ["@module"] = { fg = p.accent.keyword },
  ["@module.builtin"] = { fg = p.accent.keyword },
  ["@label"] = { fg = p.accent.string_escape },

  -- Strings
  ["@string"] = { fg = p.accent.string },
  ["@string.documentation"] = { fg = p.base.fg_muted, italic = true },
  ["@string.regexp"] = { fg = p.accent.string_escape },
  ["@string.escape"] = { fg = p.accent.string_escape },
  ["@string.special"] = { fg = p.accent.string_escape },
  ["@string.special.symbol"] = { fg = p.accent.number },
  ["@string.special.url"] = { fg = p.accent.type, underline = true },
  ["@character"] = { fg = p.accent.string },
  ["@character.special"] = { fg = p.accent.string_escape },
  ["@number"] = { fg = p.accent.number },
  ["@number.float"] = { fg = p.accent.number },
  ["@boolean"] = { fg = p.accent.number },

  -- Functions
  ["@function"] = { fg = p.accent.function_ },
  ["@function.builtin"] = { fg = p.accent.function_ },
  ["@function.call"] = { fg = p.accent.function_ },
  ["@function.macro"] = { fg = p.accent.string_escape },
  ["@function.method"] = { fg = p.accent.function_ },
  ["@function.method.call"] = { fg = p.accent.function_ },
  ["@constructor"] = { fg = p.accent.type },
  ["@operator"] = { fg = p.accent.operator },

  -- Keywords
  ["@keyword"] = { fg = p.accent.keyword },
  ["@keyword.coroutine"] = { fg = p.accent.keyword },
  ["@keyword.function"] = { fg = p.accent.keyword },
  ["@keyword.operator"] = { fg = p.accent.operator },
  ["@keyword.import"] = { fg = p.accent.keyword },
  ["@keyword.type"] = { fg = p.accent.keyword },
  ["@keyword.modifier"] = { fg = p.accent.keyword },
  ["@keyword.repeat"] = { fg = p.accent.keyword },
  ["@keyword.return"] = { fg = p.accent.keyword },
  ["@keyword.debug"] = { fg = p.diagnostic.error },
  ["@keyword.exception"] = { fg = p.accent.keyword },
  ["@keyword.conditional"] = { fg = p.accent.keyword },
  ["@keyword.conditional.ternary"] = { fg = p.accent.operator },
  ["@keyword.directive"] = { fg = p.accent.keyword },
  ["@keyword.directive.define"] = { fg = p.accent.keyword },

  -- Punctuation
  ["@punctuation.delimiter"] = { fg = p.base.fg_dim },
  ["@punctuation.bracket"] = { fg = p.base.fg_dim },
  ["@punctuation.special"] = { fg = p.accent.string_escape },

  -- Comments
  ["@comment"] = { fg = p.base.fg_muted, italic = true },
  ["@comment.documentation"] = { fg = p.base.fg_muted, italic = true },
  ["@comment.error"] = { fg = p.diagnostic.error, italic = true },
  ["@comment.warning"] = { fg = p.diagnostic.warn, italic = true },
  ["@comment.todo"] = { fg = p.base.bg, bg = p.accent.orange_bright, bold = true },
  ["@comment.note"] = { fg = p.diagnostic.info, italic = true },

  -- Markup (markdown/help/comments)
  ["@markup.strong"] = { fg = p.accent.function_, bold = true },
  ["@markup.italic"] = { fg = p.accent.keyword, italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.heading"] = { fg = p.accent.orange, bold = true },
  ["@markup.heading.1"] = { fg = p.accent.orange, bold = true },
  ["@markup.heading.2"] = { fg = p.accent.type, bold = true },
  ["@markup.heading.3"] = { fg = p.accent.keyword, bold = true },
  ["@markup.heading.4"] = { fg = p.accent.string_escape, bold = true },
  ["@markup.heading.5"] = { fg = p.accent.number, bold = true },
  ["@markup.heading.6"] = { fg = p.accent.function_, bold = true },
  ["@markup.quote"] = { fg = p.base.fg_muted, italic = true },
  ["@markup.raw"] = { fg = p.accent.type },
  ["@markup.raw.block"] = { fg = p.accent.type, bg = p.base.bg_dim },
  ["@markup.math"] = { fg = p.accent.number },
  ["@markup.link"] = { fg = p.accent.type, underline = true },
  ["@markup.link.label"] = { fg = p.accent.type, underline = true },
  ["@markup.link.url"] = { fg = p.accent.type, underline = true },
  ["@markup.list"] = { fg = p.accent.function_ },
  ["@markup.list.checked"] = { fg = p.accent.string },
  ["@markup.list.unchecked"] = { fg = p.base.fg_dim },

  -- Diff
  ["@diff.plus"] = { fg = p.diff.add },
  ["@diff.minus"] = { fg = p.diff.delete },
  ["@diff.delta"] = { fg = p.diff.change },

  -- Types
  ["@type"] = { fg = p.accent.type },
  ["@type.builtin"] = { fg = p.accent.type },
  ["@type.definition"] = { fg = p.accent.type },
  ["@attribute"] = { fg = p.accent.string_escape },
  ["@attribute.builtin"] = { fg = p.accent.string_escape },
  ["@property"] = { fg = p.accent.property },

  -- Tags (HTML/JSX/etc.)
  ["@tag"] = { fg = p.accent.keyword },
  ["@tag.builtin"] = { fg = p.accent.keyword },
  ["@tag.attribute"] = { fg = p.base.fg_dim, italic = true },
  ["@tag.delimiter"] = { fg = p.base.fg_dim },
}

return M
