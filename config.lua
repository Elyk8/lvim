--  GENERAL

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
lvim.transparent_window = false

-- SETTINGS

vim.opt.foldenable = true -- Turn on folding
vim.opt.foldlevel = 0 -- Autofold everything by default
vim.opt.foldnestmax = 1 -- I only like to fold outer functions
vim.opt.foldmethod = "marker"

vim.opt.inccommand = "split" -- Preview substitute live
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- KEYMAPPINGS

-- Remaps
lvim.leader = "space"

-- yank to the end of line
lvim.keys.normal_mode["Y"] = "y$"
-- paste on cursor
lvim.keys.normal_mode["gP"] = "i<CR><Esc>PkJxJx"
lvim.keys.normal_mode["gp"] = "a<CR><Esc>PkJxJx"

-- save keypresses
lvim.keys.normal_mode["o"] = "o<Esc>"
lvim.keys.normal_mode["O"] = "O<Esc>"
lvim.keys.normal_mode["<esc><esc>"] = "ze"

lvim.keys.insert_mode["<C-s>"] = "<c-g>u<Esc>[s1z=`]a<c-g>u"

-- replace currently selected text with default register without yanking it
lvim.keys.normal_mode["x"] = '"_x'
lvim.keys.normal_mode["X"] = '"_X'
lvim.keys.visual_mode["p"] = '"_dP'

vim.cmd [[
  map Q gq
  map ; :
]]

-- LSP Settings

lvim.lsp.diagnostics.virtual_text = false

require("user.external-helpers").formatters()
require("user.external-helpers").linters()

lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings.o = {
  name = "+Scripts",
  c = { [[<cmd>terminal compiler %<CR>]], "Compile using compiler" },
  p = { [[<cmd>!opout %<CR><CR>]], "Preview using compiler" },
  s = { [[<cmd>setlocal spell! spelllang=en_au<CR>]], "Toggle spell check" },
}

-- PLUGINS

-- Builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.terminal.shade_terminals = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

-- Additional Plugins
lvim.plugins = {
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("user.nvim-lastplace").config()
    end,
  },
  { "LunarVim/Colorschemes" },
  { "folke/tokyonight.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("user.colorizer").config()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufReadPre",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.cmd "call vimtex#init()"
      require("user.latex").vimtex()
      require("user.latex").settings()
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("user.zen").config()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.neoscroll").config()
    end,
  },
}

-- THEMES

vim.g.transparent_background = true -- transparent background(Default: false)
vim.g.italic_comments = true -- italic comments(Default: true)
vim.g.italic_keywords = true -- italic keywords(Default: true)
vim.g.italic_functions = true -- italic functions(Default: false)
vim.g.italic_variables = true -- italic variables(Default: false)

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- OTHERS

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufRead,BufNewFile", [[Xresources,Xdefaults,xresources,xdefaults,*.xresources]], "set filetype=xdefaults" },
  { "BufRead,BufNewFile", "*.tsv", "set filetype=tsv" },
  { "BufWritePost", "bm-dirs,bm-files", "!shortcuts" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  { "BufRead,BufNewFile", "*.ms,*.me,*.mom,*.man", "set filetype=groff" },
  { "BufRead,BufNewFile", "*.rasi", "set filetype=rasi" },
}
