local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.autoformat_enabled = true
g.cmp_enabled = true
g.autopairs_enabled = true
g.icons_enabled = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- line-numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true

vim.cmd.colorscheme = "onedark"