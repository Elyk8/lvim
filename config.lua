--  GENERAL
require("user.settings")
require("user.keys")
require('user.bufferline')
require('user.plugins')

lvim.lsp.diagnostics.virtual_text = false

-- PLUGINS

-- Builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shade_terminals = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "c", "bash", "python", "lua", "cpp", "bibtex" }
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- THEMES

vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
