local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return
end

nvim_tree.ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
}

local on_attach = function(bufnr)
  local api = require('nvim-tree.api');
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', '<C-b>', ':NvimTreeFocus <CR>')
end

nvim_tree.setup {
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 37,
    -- height = 30, nvim tree update 
    -- hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    -- mappings = {
    --   custom_only = false,
    --   list = {
    --     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
    --     { key = "h", cb = tree_cb "close_node" },
    --     { key = "v", cb = tree_cb "vsplit" },
    --   },
    -- },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
      highlight_git = true,
      highlight_opened_files = "none",
      indent_width=2,
      indent_markers = {
         enable = false,
      },

      icons = {
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
         },

          glyphs = {
            default = "",
            symlink = "",
            folder = {
              -- default = "",
              -- empty = "",
              -- empty_open = "",
              -- open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            -- git = {
            --   unstaged = "✗",
            --   staged = "✓",
            --   unmerged = "",
            --   renamed = "➜",
            --   untracked = "★",
            --   deleted = "",
            --   ignored = "◌",
            -- },
          },
      },
   },
}
