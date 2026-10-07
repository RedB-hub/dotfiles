vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false

-- Suggest words from the current file automatically while typing
vim.opt.complete = "."
vim.opt.autocomplete = true
-- Show the menu even for one match, and don't insert anything until you choose
vim.opt.completeopt = { "menuone", "noselect" }
