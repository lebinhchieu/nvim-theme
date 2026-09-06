-- User-facing options, set via `require("mango-parrot").setup({ ... })`.
--
-- Deliberately two options rather than a toggle per taste. Anything else a
-- user wants to change is one entry in `on_highlights`, which is both smaller
-- than a bespoke flag and open-ended -- a `no_italic_comments` option can only
-- turn off italic comments, whereas the callback can also retone a border,
-- restyle one plugin, or add a group the theme has never heard of.

local M = {}

M.defaults = {
  -- Paint Neovide's window title bar to match the theme's chrome. No effect
  -- outside Neovide. Opt-out because it writes `vim.g.neovide_*`, which is
  -- further than a colorscheme normally reaches.
  neovide = true,

  --- Last word on every highlight group, called with the fully merged table
  --- just before it is applied.
  --- @type fun(highlights: table<string, table>, palette: table)|nil
  on_highlights = nil,
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
