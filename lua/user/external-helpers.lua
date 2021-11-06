local M = {}

M.formatters = function()
  lvim.lang.markdown.formatters = { { exe = "prettierd" } }
  -- set a formatter, this will override the language server formatting capabilities (if it exists)
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    {
      exe = "black",
      filetypes = { "python" },
    },
    {
      exe = "uncrustify",
      filetypes = { "c", "cpp" },
    },
    {
      exe = "stylua",
      filetypes = { "lua" },
    },
    {
      exe = "shfmt",
      filetypes = { "sh", "zsh", "bash" },
      args = { "-ln", "posix", "-ci", "-kp", "-fn" },
    },
    {
      exe = "prettier",
      ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
      filetypes = { "typescript", "typescriptreact", "markdown" },
    },
  }
end

M.linters = function()
  -- set additional linters
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { exe = "flake8", filetypes = { "python" } },
    { exe = "cppcheck", filetypes = { "c", "cpp" } },
    { exe = "shellcheck", filetypes = { "sh", "zsh", "bash" } },
  }
end

return M
