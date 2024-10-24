-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.backup = true
vim.opt.list = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- true by default, but let smake sure
vim.g.editorconfig = true

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

