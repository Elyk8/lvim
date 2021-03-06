-- Lunarvim
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"
lvim.transparent_window = false
lvim.line_wrap_cursor_movement = false

-- General
require "config.settings"
require "config.keys"
require "config.plugins"
require "user.bufferline"

lvim.lsp.diagnostics.virtual_text = false

-- Plugins

-- Builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shade_terminals = false
lvim.builtin.notify.active = false
lvim.builtin.autopairs.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "norg",
  "norg_meta",
  "norg_table",
  "c",
  "cpp",
  "latex",
  "markdown",
  "lua",
  "haskell",
  "rasi",
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

lvim.builtin.fancy_statusline = { active = false } -- enable/disable fancy statusline
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end
