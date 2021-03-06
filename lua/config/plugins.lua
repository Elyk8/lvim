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
  { "LunarVim/darkplus.nvim" },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("user.nvim-lastplace").config()
    end,
  },
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
    "jakewvincent/mkdnflow.nvim",
    ft = "markdown",
    config = function()
      require("user.mkdnflow").config()
    end,
  },
  {
    "jubnzv/mdeval.nvim",
    ft = "markdown",
    config = function()
      vim.g.markdown_fenced_languages = { "python", "cpp", "c", "sh" }
      require("mdeval").setup {
        -- Don't ask before executing code blocks
        require_confirmation = false,
        -- Change code blocks evaluation options.
        eval_options = {
          -- Set custom configuration for C++
          cpp = {
            command = { "clang++", "-std=c++20", "-O0" },
            default_header = [[
    #include <iostream>
    #include <vector>
    using namespace std;
      ]],
          },
          -- Add new configuration for Racket
          racket = {
            command = { "racket" }, -- Command to run interpreter
            language_code = "racket", -- Markdown language code
            exec_type = "interpreted", -- compiled or interpreted
            extension = "rkt", -- File extension for temporary files
          },
        },
      }
    end,
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
  {
    "MattesGroeger/vim-bookmarks",
    config = function()
      -- highlight BookmarkSign ctermbg=NONE ctermfg=160
      -- highlight BookmarkLine ctermbg=194 ctermfg=NONE
      vim.g.bookmark_sign = "???"
      vim.g.bookmark_annotation_sign = "???"
      vim.g.bookmark_no_default_key_mappings = 1
      vim.g.bookmark_auto_save = 0
      vim.g.bookmark_auto_close = 0
      vim.g.bookmark_manage_per_buffer = 0
      vim.g.bookmark_save_per_working_dir = 0
      -- vim.g.bookmark_highlight_lines = 1
      vim.g.bookmark_show_warning = 0
      vim.g.bookmark_center = 1
      vim.g.bookmark_location_list = 0
      vim.g.bookmark_disable_ctrlp = 1
      vim.g.bookmark_display_annotation = 0
      -- vim.g.bookmark_auto_save_file = '~/.config/lvim/bookmarks'
    end,
    commit = "a86f6387a5dabf0102b4cab433b414a29456f792",
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
  },
  {
    "ekickx/clipboard-image.nvim",
    ft = "markdown",
    config = function()
      require("clipboard-image").setup {
        -- Default configuration for all typefile
        default = {
          img_dir = "img",
          img_dir_txt = "img",
          img_name = function()
            return os.date "%Y-%m-%d-%H-%M-%S"
          end,
          affix = "%s",
        },
        -- You can create configuration for certain filetype by creating another field (markdown, in this case)
        -- If you're uncertain what to name your field to, you can run `:set filetype?`
        -- Missing options from `markdown` field will be replaced by options from `default` field
        markdown = {
          img_dir = { "%:p:h", "images" },
          img_dir_txt = "images",
          affix = "![](%s)",
        },
      }
    end,
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require("user.neorg").config()
    end,
  },
  {
    "baskerville/vim-sxhkdrc",
    ft = "sxhkdrc"
  },
  -- {
  --   "NTBBloodbath/doom-one.nvim",
  --   config = function()
  --     require("doom-one").setup {
  --       cursor_coloring = true,
  --       terminal_colors = false,
  --       italic_comments = true,
  --       enable_treesitter = true,
  --       transparent_background = false,
  --       pumblend = {
  --         enable = true,
  --         transparency_amount = 20,
  --       },
  --       plugins_integrations = {
  --         neorg = true,
  --         barbar = true,
  --         bufferline = false,
  --         gitgutter = false,
  --         gitsigns = true,
  --         telescope = false,
  --         neogit = true,
  --         nvim_tree = true,
  --         dashboard = true,
  --         startify = true,
  --         whichkey = true,
  --         indent_blankline = true,
  --         vim_illuminate = true,
  --         lspsaga = false,
  --       },
  --     }
  --   end,
  -- },
}
