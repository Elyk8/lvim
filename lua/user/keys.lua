-- Lunarvim
lvim.leader = "space"

-- Keymappings
-- yank to the end of line
lvim.keys.normal_mode["Y"] = "y$"
-- paste on cursor
lvim.keys.normal_mode["gP"] = "i<CR><Esc>PkJxJx"
lvim.keys.normal_mode["gp"] = "a<CR><Esc>PkJxJx"

-- save keypresses
lvim.keys.normal_mode["o"] = "o<Esc>"
lvim.keys.normal_mode["O"] = "O<Esc>"
lvim.keys.normal_mode["<esc><esc>"] = "ze"
lvim.keys.normal_mode["X"] = "<cmd>BufferClose!<CR>"

lvim.keys.insert_mode["<C-l>"] = "<c-g>u<Esc>[s1z=`]a<c-g>u"
lvim.keys.normal_mode["<C-s>"] = "<cmd>wa!<CR>"

-- replace currently selected text with default register without yanking it
lvim.keys.normal_mode["x"] = '"_x'
lvim.keys.normal_mode["X"] = '"_X'
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["s"] = '"_s'

lvim.keys.normal_mode["<F1>"] = ":e ~/wiki/index.md<cr>"
lvim.keys.normal_mode["<F3>"] = ":e .<cr>"
lvim.keys.normal_mode["<F4>"] = "<cmd>Telescope resume<cr>"
lvim.keys.normal_mode["<F5>"] = "<cmd>Telescope commands<CR>"
lvim.keys.normal_mode["<F6>"] =
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]]
lvim.keys.normal_mode["<F7>"] = "<cmd>TSHighlightCapturesUnderCursor<cr>"
lvim.keys.normal_mode["<F8>"] = "<cmd>TSPlaygroundToggle<cr>"
lvim.keys.normal_mode["<F11>"] = "<cmd>lua vim.lsp.buf.references()<CR>"
lvim.keys.normal_mode["<F12>"] = "<cmd>lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["ma"] = "<cmd>BookmarkAnnotate<cr>"
lvim.keys.normal_mode["mc"] = "<cmd>BookmarkClear<cr>"
lvim.keys.normal_mode["mm"] = "<cmd>BookmarkToggle<cr>"
lvim.keys.normal_mode["mh"] = '<cmd>lua require("harpoon.mark").add_file()<cr>'
lvim.keys.normal_mode["mj"] = "<cmd>BookmarkNext<cr>"
lvim.keys.normal_mode["mk"] = "<cmd>BookmarkPrev<cr>"
lvim.keys.normal_mode["ms"] =
  "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>"
lvim.keys.normal_mode["mx"] = "<cmd>BookmarkClearAll<cr>"
lvim.keys.normal_mode["mu"] = '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>'

vim.cmd [[
  map Q gq
  map ; :
]]

-- WhichKey
lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings.o = {
  name = "+Scripts",
  c = { [[<cmd>terminal compiler %<CR>]], "Compile using compiler" },
  p = { [[<cmd>!opout %<CR><CR>]], "Preview using compiler" },
  s = { [[<cmd>setlocal spell! spelllang=en_au<CR>]], "Toggle spell check" },
}
lvim.builtin.which_key.mappings["m"] = {
  name = "Replace",
  a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
  -- b = { "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>", "Show Buffer" },
  c = { "<cmd>BookmarkClear<cr>", "Clear" },
  h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon Mark" },
  u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon Menu" },
  m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
  j = { "<cmd>BookmarkNext<cr>", "Next" },
  k = { "<cmd>BookmarkPrev<cr>", "Prev" },
  -- q = { "<cmd>BookmarkShowAll<cr>", "Show QF" },
  s = {
    "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
    "Show All",
  },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
}
