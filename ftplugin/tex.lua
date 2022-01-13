vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_method = "general"
vim.g.vimtex_fold_enabled = 0
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 5

vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]

lvim.builtin.which_key.mappings.t = {
  name = "+Latex",
  c = { "<cmd>VimtexCompile<cr>", "Toggle Compilation Mode" },
  C = { "<cmd>VimtexClean<cr>", "Clean build files" },
  e = { "<cmd>VimtexErrors<cr>", "Show Errors" },
  f = { "<cmd>call vimtex#fzf#run()<cr>", "Fzf Find" },
  i = { "<cmd>VimtexInfo<cr>", "Project Information" },
  s = { "<cmd>VimtexStop<cr>", "Stop Project Compilation" },
  t = { "<cmd>VimtexTocToggle<cr>", "Toggle Table Of Content" },
  v = { "<cmd>VimtexView<cr>", "View PDF" },
}

vim.g["tex_flavor"] = "latex"

-- Compile on initialization, cleanup on quit
vim.cmd [[
hi Conceal guibg=NONE
inoremap <C-i> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-i> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

augroup vimtex_event_1
  au!
  au User VimtexEventQuit     call vimtex#compiler#clean(0)
augroup END
]]

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.conceallevel = 2
