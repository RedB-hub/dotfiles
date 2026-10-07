vim.pack.add({ "https://github.com/stevearc/aerial.nvim" })

require("aerial").setup()

-- Open or close the symbol tree on the left; ! keeps your cursor in the code
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle! left<CR>", { desc = "Toggle symbol outline" })
