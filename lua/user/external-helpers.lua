local M = {}

M.formatters = function()
  lvim.lang.c.formatters = { { exe = "uncrustify" } }
  lvim.lang.cpp.formatters = { { exe = "uncrustify" } }
  lvim.lang.javascript.formatters = { { exe = "prettier" } }
  lvim.lang.json.formatters = { { exe = "prettier" } }
  lvim.lang.lua.formatters = { { exe = "stylua" } }
  lvim.lang.python.formatters = { { exe = "black" } }
  lvim.lang.sh.formatters = { { exe = "shfmt" } }

end

M.linters = function()
  lvim.lang.python.linters = { { exe = "flake8" } }
end

return M
