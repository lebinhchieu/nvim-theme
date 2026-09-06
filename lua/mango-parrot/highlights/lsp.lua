-- LSP semantic token groups (@lsp.type.*), mapped from the source VS Code
-- semanticTokenColors. Linked to the equivalent Treesitter/syntax groups
-- (syntax.lua) rather than re-declaring colors, so the two layers can never
-- disagree on a role's color.

local p = require("mango-parrot.palette")

return {
  ["@lsp.type.class"] = { link = "@type" },
  ["@lsp.type.interface"] = { link = "@type" },
  ["@lsp.type.enum"] = { link = "@type" },
  ["@lsp.type.enumMember"] = { link = "@constant" },
  ["@lsp.type.type"] = { link = "@type" },
  ["@lsp.type.typeParameter"] = { link = "@type.builtin" },
  ["@lsp.type.parameter"] = { link = "@variable.parameter" },
  ["@lsp.type.variable"] = { link = "@variable" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.function"] = { link = "@function" },
  ["@lsp.type.method"] = { link = "@function.method" },
  ["@lsp.type.decorator"] = { link = "@attribute" },
  ["@lsp.type.macro"] = { link = "@function.macro" },
  ["@lsp.type.namespace"] = { link = "@type" }, -- source semanticTokenColors.namespace = cyan, not the pink used for import paths
  ["@lsp.type.keyword"] = { link = "@keyword" },
  ["@lsp.type.comment"] = { link = "@comment" },
  ["@lsp.type.string"] = { link = "@string" },
  ["@lsp.type.number"] = { link = "@number" },
  ["@lsp.type.operator"] = { link = "@operator" },
  ["@lsp.type.regexp"] = { link = "@string.regexp" },
  ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
  -- source semanticTokenColors.lifetime = magenta italic; no existing @-group matches both, so declared directly
  ["@lsp.type.lifetime"] = { fg = p.accent.number, italic = true },
  ["@lsp.mod.readonly"] = { link = "@constant" },
  ["@lsp.mod.deprecated"] = { strikethrough = true },
}
