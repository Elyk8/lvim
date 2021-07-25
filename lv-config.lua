--  general

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"

-- SETTINGS

-- folding options
vim.opt.foldclose = "all"
-- vim.opt.foldcolumn = "1" -- Show the foldcolumn
vim.opt.foldenable = true -- Turn on folding
vim.opt.foldlevel = 0 -- Autofold everything by default
vim.opt.foldnestmax = 1 -- I only like to fold outer functions
vim.opt.foldopen = "all"
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = ">>>>>{,}<<<<<"

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keymappings

lvim.keys.leader_key = "space"

vim.cmd [[
nnoremap Y y$

" paste on cursor
nnoremap gP i<CR><Esc>PkJxJx
nnoremap gp a<CR><Esc>PkJxJx

" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP
nnoremap gp a<CR><Esc>PkJxJx

" replace exmode with gq
map Q gq

" save keypresses
noremap ; :
nnoremap o o<Esc>
nnoremap O O<Esc>

" autocorrection
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" accordion expand traversal of folds
nnoremap z] :<C-u>silent! normal! zc<CR>zjzozz 
nnoremap z[ :<C-u>silent! normal! zc<CR>zkzo[zzz
]]

-- Builtin plugins

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.terminal.shade_terminals = false

lvim.builtin.compe.autocomplete = true
lvim.builtin.compe.source.buffer = false

lvim.vsnip_dir = os.getenv("HOME") .. "/.config/lvim/snippets"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "bash", "lua", "cpp", "c", "latex", "html", "java", "json", "javascript", "bibtex" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- lua
lvim.lang.lua.formatter.args = { "--config-path " .. os.getenv "HOME" .. "/.config/lvim/.stylua.toml" }

-- clang
lvim.lang.c.formatter.args = {
  [[ -style="{ BasedOnStyle: Microsoft, IndentWidth: 4, ColumnLimit: 0,
  AlignConsecutiveAssignments: AcrossEmptyLinesAndComments,
  AlignConsecutiveBitFields: AcrossEmptyLinesAndComments }" ]],
}

-- Additional Plugins
lvim.plugins = {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      }
    end,
  },
  { "lunarvim/colorschemes" },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup({ "*", "!vim" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
      vim.cmd "ColorizerReloadAllBuffers"
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    event = "BufRead",
  }
}

-- Setting for https://github.com/LunarVim/Colorschemes

vim.g.transparent_background = true -- transparent background(Default: false)
vim.g.italic_comments = true -- italic comments(Default: true)
vim.g.italic_keywords = true -- italic keywords(Default: true)
vim.g.italic_functions = true -- italic functions(Default: false)
vim.g.italic_variables = false -- italic variables(Default: false)

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

lvim.autocommands = {
  { "BufWritePost", "bm-files,bm-dirs", "!shortcuts" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  {
    "BufWritePost",
    "~/.local/src/dwmblocks/config.h",
    "!cd ~/.local/src/dwmblocks/; sudo make install clean && { killall -q dwmblocks; setsid -f dwmblocks }",
  },
}

-- Additional Leader bindings for WhichKey

lvim.builtin.which_key.mappings.o = {
    name = "+Scripts",
    c = { [[<cmd>w! | ! compiler %<CR>]], "Compile using compiler" },
    p = { [[<cmd>!opout %<CR><CR>]], "Preview using compiler" },
    s = { [[<cmd>setlocal spell! spelllang=en_au<CR>]], "Toggle spell check" },
}

-- PERSONAL SETTINGS

