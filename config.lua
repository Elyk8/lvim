--  GENERAL

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
lvim.transparent_window = false

-- SETTINGS

vim.opt.timeoutlen = 250

-- folding options
vim.opt.foldclose = "all"
-- vim.opt.foldcolumn = "1" -- Show the foldcolumn
vim.opt.foldenable = true -- Turn on folding
vim.opt.foldlevel = 0 -- Autofold everything by default
vim.opt.foldnestmax = 1 -- I only like to fold outer functions
vim.opt.foldopen = "all"
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = ">>>>>{,}<<<<<"

vim.opt.inccommand = "split" -- Preview substitute live

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- KEYMAPPINGS

-- Remaps
local normalmaps = lvim.keys.normal_mode
local insertmaps = lvim.keys.insert_mode
local visualmaps = lvim.keys.visual_block_mode

lvim.leader = "space"

normalmaps["Y"] = "y$"
-- paste on cursor
normalmaps["gP"] = "i<CR><Esc>PkJxJx"
normalmaps["gp"] = "a<CR><Esc>PkJxJx"

-- save keypresses
normalmaps[";"] = {":", { silent = false}}
normalmaps["o"] = "o<Esc>"
normalmaps["O"] = "O<Esc>"

insertmaps["<C-s>"] = "<c-g>u<Esc>[s1z=`]a<c-g>u"

-- replace currently selected text with default register without yanking it
visualmaps["p"] = '"_dP'
visualmaps[";"] = {":", { silent = false}}

vim.cmd [[map Q gq]]

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

lvim.builtin.galaxyline.colors.alt_bg = "#1a1b26"
lvim.builtin.galaxyline.colors.grey = "#c0caf5"

lvim.vsnip_dir = os.getenv "HOME" .. "/.config/lvim/snippets"

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
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
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
}

-- Setting for https://github.com/LunarVim/Colorschemes

vim.g.transparent_background = false -- transparent background(Default: false)
vim.g.italic_comments = true -- italic comments(Default: true)
vim.g.italic_keywords = true -- italic keywords(Default: true)
vim.g.italic_functions = true -- italic functions(Default: false)
vim.g.italic_variables = false -- italic variables(Default: false)

-- Setting for tokyonight
vim.g.tokyonight_transparent = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- LSP Settings

lvim.lsp.diagnostics.signs.active = false
lvim.lsp.diagnostics.underline = false

-- OTHERS

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

lvim.autocommands.custom_groups = {
  { "BufRead,BufNewFile", [[Xresources,Xdefaults,xresources,xdefaults,*.xresources]], "set filetype=xdefaults" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  {
    "BufWritePost",
    "~/.local/src/dwmblocks/blocks.h",
    "!cd ~/.local/src/dwmblocks/; sudo make install clean && { killall dwmblocks && setsid dwmblocks }",
  },
}
