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

-- Never leave decrypted pass entries on disk (swap, undo, backup, history)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
  pattern = { "*/pass.*/*" },
  callback = function()
    vim.opt_local.swapfile = false
    vim.opt_local.undofile = false
    vim.opt_local.backup = false
    vim.opt_local.writebackup = false
    vim.opt.shada = "" -- don't record anything from this session
  end,
})
