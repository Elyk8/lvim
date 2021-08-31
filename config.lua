-- LOCAL VARIABLES

local nmap = lvim.keys.normal_mode
local imap = lvim.keys.insert_mode
local vmap = lvim.keys.visual_block_mode
local o = vim.opt
local cmd = vim.cmd

--  GENERAL

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"
lvim.transparent_window = false

-- SETTINGS

-- folding options
o.foldenable = true -- Turn on folding
o.foldlevel = 0 -- Autofold everything by default
o.foldnestmax = 1 -- I only like to fold outer functions
o.foldmethod = "marker"

o.inccommand = "split" -- Preview substitute live

o.ignorecase = true
o.smartcase = true

-- KEYMAPPINGS

-- Remaps
lvim.leader = "space"

-- yank to the end of line
nmap["Y"] = "y$"
-- paste on cursor
nmap["gP"] = "i<CR><Esc>PkJxJx"
nmap["gp"] = "a<CR><Esc>PkJxJx"

-- save keypresses
nmap[";"] = { ":", { silent = false } }
nmap["o"] = "o<Esc>"
nmap["O"] = "O<Esc>"

nmap["<esc><esc>"] = "ze"

imap["<C-s>"] = "<c-g>u<Esc>[s1z=`]a<c-g>u"

-- replace currently selected text with default register without yanking it
vmap["p"] = '"_dP'
vmap[";"] = { ":", { silent = false } }

cmd [[map Q gq]]

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
local which_keymappings = lvim.builtin.which_key.mappings

which_keymappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
which_keymappings.o = {
  name = "+Scripts",
  c = { [[<cmd>w! | ! compiler %<CR>]], "Compile using compiler" },
  p = { [[<cmd>!opout %<CR><CR>]], "Preview using compiler" },
  s = { [[<cmd>setlocal spell! spelllang=en_au<CR>]], "Toggle spell check" },
}

-- PLUGINS

-- Builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.terminal.shade_terminals = false

lvim.builtin.compe.autocomplete = true
lvim.builtin.compe.source.neorg = true

lvim.vsnip_dir = vim.loop.os_homedir() .. "/.config/lvim/snippets"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "lua",
  "cpp",
  "c",
  "latex",
  "html",
  "java",
  "json",
  "javascript",
  "bibtex",
}
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
lvim.plugins = {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("user.nvim-lastplace").config()
    end,
  },
  { "LunarVim/Colorschemes" },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("user.colorizer").config()
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
    event = "BufRead",
    config = function()
      vim.cmd "call vimtex#init()"
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("user.zen").config()
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
    "ellisonleao/glow.nvim",
    ft = "markdown",
    cmd = { "Glow", "GlowInstall" },
  },
  {
    "jubnzv/mdeval.nvim",
    ft = "markdown",
    event = "BufRead",
    config = function()
      require("user.mdeval").config()
    end,
  },
}

-- THEMES

-- Settings for lunarvim colorschemes
vim.g.transparent_background = true -- transparent background(Default: false)
vim.g.italic_comments = true -- italic comments(Default: true)
vim.g.italic_keywords = true -- italic keywords(Default: true)
vim.g.italic_functions = true -- italic functions(Default: false)
vim.g.italic_variables = true -- italic variables(Default: false)

-- LSP Settings

lvim.lsp.diagnostics.signs.active = false
lvim.lsp.diagnostics.underline = false

-- OTHERS

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufRead,BufNewFile", [[Xresources,Xdefaults,xresources,xdefaults,*.xresources]], "set filetype=xdefaults" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
}
