-- Shared LSP/completion "kind" -> color mapping (Array, Class, Function, ...).
-- Both trouble.nvim's TroubleIcon<Kind> groups and the completion menu's
-- CmpItemKind<Kind>/BlinkCmpKind<Kind> groups need the same ~30-entry kind
-- palette, so it's built once here and consumed by both highlight modules.

local p = require("mango-parrot.palette")

return {
  Array = p.accent.number,
  Boolean = p.accent.number,
  Class = p.accent.type,
  Color = p.accent.number,
  Constant = p.accent.number,
  Constructor = p.accent.type,
  Enum = p.accent.type,
  EnumMember = p.accent.number,
  Event = p.accent.string_escape,
  Field = p.accent.property,
  File = p.base.fg_dim,
  Folder = p.accent.function_,
  Function = p.accent.function_,
  Interface = p.accent.type,
  Key = p.accent.property,
  Keyword = p.accent.keyword,
  Method = p.accent.function_,
  Module = p.accent.keyword,
  Namespace = p.accent.keyword,
  Null = p.accent.number,
  Number = p.accent.number,
  Object = p.accent.property,
  Operator = p.accent.operator,
  Package = p.accent.keyword,
  Property = p.accent.property,
  Reference = p.accent.type,
  Snippet = p.accent.string_escape,
  String = p.accent.string,
  Struct = p.accent.type,
  Text = p.base.fg,
  TypeParameter = p.accent.type,
  Unit = p.accent.number,
  Value = p.accent.number,
  Variable = p.base.fg,
}
