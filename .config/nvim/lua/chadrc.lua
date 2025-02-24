-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "penumbra_dark",
    theme_toggle = { "onedark", "ayu_light" },
    transparency = true
}

M.ui = {
    statusline = {
        theme = "vscode_colored",
        separator_style = "block"
    },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "       __               _               ",
        "      / /_  ____  _____(_)___  ____ _   ",
        "     / __ \\/ __ \\/ ___/ / __ \\/ __ `/   ",
        "    / /_/ / /_/ / /  / / / / / /_/ /    ",
        "   /_.___/\\____/_/  /_/_/ /_/\\__, /     ",
        "                              /____/         ",
        "                                        ",
        "                                        ",
        "                                        ",
        "                                        ",
    }
}

M.lsp = {
    signature = false
}

return M
