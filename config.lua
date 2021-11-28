-- Lunarvim
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "doom-one"
lvim.transparent_window = false
lvim.line_wrap_cursor_movement = false

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
lvim.builtin.autopairs.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "c", "bash", "python", "lua", "cpp", "bibtex" }
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

lvim.builtin.fancy_statusline = { active = false } -- enable/disable fancy statusline
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end
