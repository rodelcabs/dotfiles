vim.opt.fillchars = {
    eob = ' ',
}

vim.cmd[[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


  --[[ highlight SignColumn guibg = NONE ]]
  --[[ highlight NormalFloat guibg = #0000 ]]
