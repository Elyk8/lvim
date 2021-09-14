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
      ["core.keybinds"] = { -- Configure core.keybinds
        config = {
          default_keybinds = true, -- Generate the default keybinds
          neorg_leader = "<Leader>n", -- This is the default if unspecified
        },
      },
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.integrations.telescope"] = {}, -- Enable the telescope module
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
    hook = function()
      -- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
      -- And allows you to shove every Neorg keybind under one "umbrella".
      -- Require the user callbacks module, which allows us to tap into the core of Neorg
      local neorg_callbacks = require "neorg.callbacks"

      -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
      -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
      -- needs to reevaluate all the bound keys is invoked
      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode

            -- Keys for managing TODO items and setting their states
            { "<C-s>", "core.integrations.telescope.find_linkable" },
          },
          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
  }
end

return M
