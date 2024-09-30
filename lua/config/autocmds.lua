-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

set_autoformat({ "cpp" }, false)
set_autoformat({ "fish" }, false)
set_autoformat({ "lua" }, false)
set_autoformat({ "perl" }, false)
set_autoformat({ "yaml" }, false)
set_autoformat({ "sh" }, false)
set_autoformat({ "cmake" }, false)

vim.api.nvim_create_user_command("F", function()
  vim.cmd("silent !clang-format -i %")
  vim.cmd("edit!")
end, {})

vim.api.nvim_create_user_command("FBA", function()
  vim.cmd("silent !clang-format -style=file:$HOME/.clang-format.darek -i %")
  vim.cmd("edit!")
end, {})

vim.api.nvim_create_user_command("F8", function()
  vim.cmd("silent !clang-format -style=file:$HOME/.clang-format.csjp -i %")
  vim.cmd("edit!")
end, {})

vim.api.nvim_create_user_command("FCC", function()
  vim.cmd("silent !clang-format -style=file:$HOME/.clang-format.cc -i %")
  vim.cmd("edit!")
end, {})

vim.api.nvim_create_user_command("TN", function()
  vim.cmd("Telescope notify")
end, {})

vim.api.nvim_set_keymap(
  "n",
  "A",
  "<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>",
  { noremap = true, silent = true }
)

-- does this help on clipboard issues at all?
vim.api.nvim_set_keymap('n', '<Esc>[2;5~', '"+y', { noremap = true, silent = true })

-- Run clang-tidy on the current file and populate quickfix list
vim.api.nvim_create_user_command('Tidy', function()
  vim.cmd('cexpr system("clang-tidy-diff.sh")')
  vim.cmd('copen')  -- Open the quickfix list
end, {})
