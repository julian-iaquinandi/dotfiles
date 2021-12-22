vim.g.tokyonight_style = 'night'
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[
  " Fix italics in Vim
  if !has('nvim')
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
  endif
]]
