-- Lunarvim
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
lvim.transparent_window = false
lvim.line_wrap_cursor_movement = false

-- Neovim
vim.opt.foldenable = true -- Turn on folding
vim.opt.foldlevel = 0 -- Autofold everything by default
vim.opt.foldnestmax = 1 -- I only like to fold outer functions
vim.opt.foldmethod = "marker"

vim.opt.inccommand = "split" -- Preview substitute live
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufRead,BufNewFile", [[Xresources,Xdefaults,xresources,xdefaults,*.xresources]], "set filetype=xdefaults" },
  { "BufRead,BufNewFile", "*.tsv", "set filetype=tsv" },
  { "BufWritePost", "bm-dirs,bm-files", "!shortcuts" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb -merge %" },
  { "BufRead,BufNewFile", "*.ms,*.me,*.mom", "set filetype=groff" },
  { "BufRead,BufNewFile", "*.rasi", "set filetype=rasi" },
  { "VimEnter", "*", [[silent exec "!kill -s SIGWINCH" getpid()]] },
}
