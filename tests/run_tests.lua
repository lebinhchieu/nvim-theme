-- Minimal test runner (no external framework installed in this repo).
-- Usage: nvim -l tests/run_tests.lua
-- Discovers every tests/*_spec.lua file, runs each `test_*` function it
-- exports, and exits non-zero if any assertion fails.

local script_dir = (debug.getinfo(1, "S").source:match("@(.*/)") or "./")
package.path = script_dir .. "../lua/?.lua;" .. script_dir .. "../lua/?/init.lua;" .. package.path

local specs = {}
for _, path in ipairs(vim.fn.glob(script_dir .. "*_spec.lua", false, true)) do
  table.insert(specs, vim.fn.fnamemodify(path, ":t:r"))
end
table.sort(specs)

local failures = 0
local total = 0

for _, spec_name in ipairs(specs) do
  local spec = dofile(script_dir .. spec_name .. ".lua")
  local names = {}
  for name in pairs(spec) do
    table.insert(names, name)
  end
  table.sort(names)

  for _, name in ipairs(names) do
    total = total + 1
    local ok, err = pcall(spec[name])
    if ok then
      print(("  ok  %s / %s"):format(spec_name, name))
    else
      failures = failures + 1
      print(("FAIL  %s / %s\n      %s"):format(spec_name, name, err))
    end
  end
end

print(("\n%d passed, %d failed (%d total)"):format(total - failures, failures, total))

if failures > 0 then
  os.exit(1)
end
