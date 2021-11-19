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
    event = "BufRead",
    config = function()
      require("user.nvim-lastplace").config()
    end,
  },
  { "folke/tokyonight.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("user.colorizer").config()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufReadPre",
    config = function()
      require "user.blankline"
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
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("user.hop").config()
    end,
  },
}
