local lualine = require ("lualine");

event = { "BufReadPost", "BufNewFile" }
config = function()
    local lualine = require "lualine"
    local stl = require "core.configs.lualine.components"
    local theme = require "core.configs.lualine.theme"

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "toggleterm",
          "alpha",
          "lazy",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          stl.mode,
          stl.branch,
          stl.diagnostics,
          stl.filename,
          "%=",
        },
        lualine_x = {
          stl.diff,
          stl.lsp,
          stl.filesize,
          stl.percent,
          stl.progress,
          stl.total_lines,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
end

config();
