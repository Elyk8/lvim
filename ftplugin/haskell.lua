local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "ormolu", filetypes = { "haskell" } },
}
