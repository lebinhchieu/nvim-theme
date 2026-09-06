-- Readability test for lua/lualine/themes/mango-parrot.lua's per-mode fill/
-- text pairings (bold, short statusline labels -- WCAG's "large text" floor
-- is 3:1; this theme holds itself to a stricter 4.0:1 given the "readability
-- is the top priority" brief -- see that file's header comment for the
-- fg-per-fill rationale).

local contrast = require("mango-parrot.contrast")
local theme = require("lualine.themes.mango-parrot")

local T = {}

local MODE_MIN = 4.0

function T.test_every_mode_a_section_meets_the_readability_floor()
  for mode_name, sections in pairs(theme) do
    local a = sections.a
    assert(a and a.bg and a.fg, ("theme.%s.a is missing fg/bg"):format(mode_name))
    local ratio = contrast.ratio(a.fg, a.bg)
    assert(
      ratio >= MODE_MIN,
      ("%s: fg %s on bg %s = %.2f, need >= %.2f"):format(mode_name, a.fg, a.bg, ratio, MODE_MIN)
    )
  end
end

return T
