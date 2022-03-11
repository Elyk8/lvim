-- set a formatter, this will override the language server formatting capabilities (if it exists)
vim.python3_host_prog = '/usr/bin/python3'
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "autopep8",
    filetypes = { "python" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
}
