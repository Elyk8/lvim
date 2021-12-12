
local M = {}

M.config = function()
  vim.g.wiki_root = "~/wiki"

  vim.g.wiki_filetypes = "md"
  vim.g.wiki_link_extension = ".md"
end

return M


