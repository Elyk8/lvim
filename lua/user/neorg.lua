local M = {}

M.config = function()
  local status_ok, neorg = pcall(require, "neorg")
  if not status_ok then
    return
  end

  neorg.setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.qol.todo_items"] = {},
      ["core.keybinds"] = { -- Configure core.keybinds
        config = {
          default_keybinds = true, -- Generate the default keybinds
          neorg_leader = "<Leader>n", -- This is the default if unspecified
        },
      },
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
        },
      },
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/neorg",
          },
        },
      },
    },
  }
end

return M
