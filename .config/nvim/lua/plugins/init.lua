return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    }
  },

  {
    "kyazdani42/nvim-tree.lua",
    opts = function ()
      local config = require("nvchad.configs.nvimtree")

      config.on_attach = function (bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', '<C-b>', ':NvimTreeFocus <CR>')
      end

      return config
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function ()
      local config = require("nvchad.configs.telescope")

      config.pickers = {
        git_branches = {
          initial_mode="normal",
          previewer = false
        },
        git_status = {
          initial_mode="normal",
          path_display={'tail'}
        },
        git_stash = {
          initial_mode="normal"
        },
        git_commits = {
          initial_mode="normal"
        },
        lsp_references = {
          initial_mode="normal",
          path_display={'tail'}
        },
        oldfiles = {
          initial_mode="normal"
        }
      }

      return config
    end
  },

  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  }
}
