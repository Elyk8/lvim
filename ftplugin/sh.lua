local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "shfmt",
    filetypes = { "sh", "zsh", "bash" },
    args = { "-p", "-ci", "-kp" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "shellcheck", filetypes = { "sh", "zsh", "bash" } },
}
vim.cmd [[setl noet ci pi sts=0 ts=4 sw=4]]
