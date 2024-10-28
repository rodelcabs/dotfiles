
local M = {}

-- TELESCOPE
M.telescope = {
    pickers = {
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
}

-- NOICE
M.noice = {
    cmdLine = {
        enabled = true,
    },
    presets = {
        lsp_doc_border = true,
        inc_rename = true
    },
    messages = {
        view = 'mini'
    },
    lsp = {
        documentation = {
            opts = {
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder"
                }
            }
        }
    },
    views = {
        cmdline_popup = {
            border = {
                style = "none",
                padding = { 1, 2 }
            },
            position = {
                col = "50%",
                row = "30%"
            }
        },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written"
            },
            opts = { skip = true }
        }
    }
}

-- NVIMTREE
M.nvimtree = {
    on_attach = function (bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', '<C-b>', ':NvimTreeFocus <CR>')
    end,
    filters = {
        dotfiles = false,
    }
}

return M
