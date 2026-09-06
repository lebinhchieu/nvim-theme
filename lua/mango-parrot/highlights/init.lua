-- Merges every highlight-group module into one table and applies it.

local modules = {
  "editor",
  "syntax",
  "lsp",
  "gitsigns",
  "bufferline",
  "whichkey",
  "mini_icons",
  "flash",
  "noice",
  "trouble",
  "snacks",
  "completion",
  "render_markdown",
  "todo_comments",
  "lazy",
  "mason",
  "grugfar",
}

local M = {}

--- Builds the full group_name -> highlight_opts table. Errors if two modules
--- define the same group name, since each module owns a disjoint namespace
--- and a collision would otherwise silently drop one definition. The
--- configured `on_highlights` hook gets the last word.
function M.groups()
  local all = {}
  local owner = {}
  for _, name in ipairs(modules) do
    local group = require("mango-parrot.highlights." .. name)
    for hl_name, opts in pairs(group) do
      if owner[hl_name] then
        error(("highlight group %q defined in both %q and %q"):format(hl_name, owner[hl_name], name))
      end
      owner[hl_name] = name
      all[hl_name] = opts
    end
  end

  local on_highlights = require("mango-parrot.config").options.on_highlights
  if on_highlights then
    on_highlights(all, require("mango-parrot.palette"))
  end

  return all
end

--- Applies every highlight group to the given namespace (0 = global).
function M.apply(ns)
  ns = ns or 0
  for name, opts in pairs(M.groups()) do
    vim.api.nvim_set_hl(ns, name, opts)
  end
end

return M
