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

lvim.keys.insert_mode["<C-s>"] = "<c-g>u<Esc>[s1z=`]a<c-g>u"

-- replace currently selected text with default register without yanking it
lvim.keys.normal_mode["x"] = '"_x'
lvim.keys.normal_mode["X"] = '"_X'
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["s"] = '"_s'

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

