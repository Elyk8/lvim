local M = {}

M.formatters = function()
  lvim.lang.cpp.formatters = { { exe = "uncrustify" } }
  lvim.lang.c.formatters = { { exe = "uncrustify" } }
  lvim.lang.javascript.formatters = { { exe = "prettierd" } }
  lvim.lang.json.formatters = { { exe = "prettierd" } }
  lvim.lang.lua.formatters = { { exe = "stylua" } }
  lvim.lang.python.formatters = { { exe = "black" } }
  lvim.lang.sh.formatters = {
    {
      exe = "shfmt",
      args = { "-ln", "posix", "-ci", "-kp" },
    },
  }
  lvim.lang.markdown.formatters = { { exe = "prettierd" } }
end

M.linters = function()
  lvim.lang.python.linters = { { exe = "flake8" } }
  lvim.lang.cpp.linters = { { exe = "cppcheck" } }
  lvim.lang.c.linters = { { exe = "cppcheck" } }
  lvim.lang.sh.linters = { { exe = "shellcheck" } }
end

return M
