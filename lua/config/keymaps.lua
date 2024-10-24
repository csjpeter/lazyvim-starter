-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy selection to system clipboard using xclip
vim.api.nvim_set_keymap("v", "<C-c>", '"*y:call system("xclip -selection clipboard", @*)<CR>', { noremap = true, silent = true })

-- Paste from system clipboard using xclip
--vim.api.nvim_set_keymap("n", "<C-v>", ':r !xclip -o -selection clipboard<CR>', { noremap = true, silent = true })
