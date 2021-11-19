vim.cmd "set noet ci pi sts=0 sw=4 ts=4"

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { {
  exe = "uncrustify",
  filetypes = { "c", "cpp" },
} }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { {
  exe = "cppcheck",
  filetypes = { "c", "cpp" },
} }
