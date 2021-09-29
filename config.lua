--  GENERAL

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"
lvim.transparent_window = true

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
lvim.keys.visual_mode["p"] = '"_dP'

vim.cmd [[map Q gq]]

-- LSP Settings

lvim.lsp.diagnostics.virtual_text = false

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
-- lvim.builtin.which_key.mappings.o = {
--   name = "+Scripts",
--   c = { [[<cmd>w! | ! compiler %<CR>]], "Compile using compiler" },
--   p = { [[<cmd>!opout %<CR><CR>]], "Preview using compiler" },
--   s = { [[<cmd>setlocal spell! spelllang=en_au<CR>]], "Toggle spell check" },
-- }

-- PLUGINS

-- Builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.terminal.shade_terminals = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

-- Additional Plugins
lvim.plugins = {
  {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
      }
    end,

    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("user.nvim-lastplace").config()
    end,
  },
  { "LunarVim/Colorschemes" },
  {
    "norcalli/nvim-colorizer.lua",
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
    config = function()
      vim.cmd "call vimtex#init()"
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
}

-- OTHERS

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufRead,BufNewFile", [[Xresources,Xdefaults,xresources,xdefaults,*.xresources]], "set filetype=xdefaults" },
--   { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
--   { "BufRead,BufNewFile", "*.ms,*.me,*.mom,*.man", "set filetype=groff" },
--   { "BufRead,BufNewFile", "*.rasi", "set filetype=rasi" },
-- }
