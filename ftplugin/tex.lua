local common_on_attach = require("lsp").common_on_attach
local common_capabilities = require("lsp").common_capabilities()

lvim.lang.tex = {
	formatter = {},
	linters = {},
  filetypes = { "tex", "bib" },
	lsp = {
		provider = "texlab",
		setup = {
			cmd = {
				DATA_PATH .. "/lspinstall/latex/texlab",
			},
			on_attach = common_on_attach,
			capabilities = common_capabilities,
		},
	},
}

vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_fold_enabled = 0

lvim.builtin.which_key.mappings.t = {
	name = "+Latex",
	c = { "<cmd>VimtexCompile<cr>", "Toggle Compilation Mode" },
	e = { "<cmd>VimtexErrors<cr>", "Show Errors" },
	f = { "<cmd>call vimtex#fzf#run()<cr>", "Fzf Find" },
	i = { "<cmd>VimtexInfo<cr>", "Project Information" },
	s = { "<cmd>VimtexStop<cr>", "Stop Project Compilation" },
	t = { "<cmd>VimtexTocToggle<cr>", "Toggle Table Of Content" },
	v = { "<cmd>VimtexView<cr>", "View PDF" },
}

-- Compile on initialization, cleanup on quit
vim.api.nvim_exec(
	[[
        augroup vimtex_event_1
            au!
            au User VimtexEventQuit     call vimtex#compiler#clean(0)
            au User VimtexEventInitPost call vimtex#compiler#compile()
        augroup END
    ]],
	false
)

vim.cmd [[
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

setl ts=4 sw=4 wrap
]]
