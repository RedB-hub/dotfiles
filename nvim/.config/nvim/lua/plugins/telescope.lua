vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- helper library Telescope needs
  "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
  pickers = {
    -- Include hidden files, but not the .git folder
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
    },
    -- Same for searching text inside files
    live_grep = {
      additional_args = function()
        return { "--hidden", "--glob", "!.git" }
      end,
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find in help" })
