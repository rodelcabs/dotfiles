require('nightly').setup({
    transparent = true
});

vim.opt.fillchars = {
    eob = ' ',
}

vim.cmd[[
try
  colorscheme nightly
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


  --[[ highlight SignColumn guibg = NONE ]]
  --[[ highlight NormalFloat guibg = #0000 ]]
