vim.opt.fillchars = {
    eob = ' ',
}

vim.cmd[[
try
  colorscheme github_dark_default
  " set fillchars+=vert:\|
  hi VertSplit ctermbg=NONE guibg=NONE guifg=#2D505E
  catch /^Vim\%((\a\+)\)\=:E185/
  set background=dark
endtry
]]

-- keep gitsigns diff colors
-- vim.cmd [[
--     hi GitSignsAdd guifg='#2da042'
--     hi GitSignsChange guifg='#0077d2'
--     hi GitSignsDelete guifg='#f85249'
-- ]]

-- color corrections
vim.cmd [[
    hi IblIndent guifg='#2b2f34'
    hi IblScope guifg='#4f565f'
]]

  --[[ highlight SignColumn guibg = NONE ]]
  --[[ highlight NormalFloat guibg = #0000 ]]
