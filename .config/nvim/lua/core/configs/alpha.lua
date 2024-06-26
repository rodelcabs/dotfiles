local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- dashboard.section.header.val = {
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "                                                                                    ",
--     "   ██╗ ██████╗   ██╗████████╗  ████████╗ █████╗ ██████╗  █████╗ ██╗   ██╗ █████╗    ",
--     "   ██║██╔════╝   ██║╚══██╔══╝  ╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗   ",
--     "   ██║╚█████╗    ██║   ██║        ██║   ██║  ██║██║  ██║███████║ ╚████╔╝ ╚═╝███╔╝   ",
--     "   ██║ ╚═══██╗   ██║   ██║        ██║   ██║  ██║██║  ██║██╔══██║  ╚██╔╝     ╚══╝    ",
--     "   ██║██████╔╝   ██║   ██║        ██║   ╚█████╔╝██████╔╝██║  ██║   ██║      ██╗     ",
--     "   ╚═╝╚═════╝    ╚═╝   ╚═╝        ╚═╝    ╚════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝     ",
--     "                                                                                    ",
-- }
-- Set menu
dashboard.section.header.val = {
    "                                                                                    ",
    "                                                                                    ",
    "                                                                                    ",
    "                                                                                    ",
    "                                                                                    ",
    "                                                                                    ",
    "                                   Tip: Don't                                       ",
    "                                                                                    ",
    "                                                                                    ",
    "                                                                                    ",
}
dashboard.section.buttons.val = {
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
