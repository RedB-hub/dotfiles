vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim", -- interface library neo-tree needs
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
})

require("neo-tree").setup({
  window = {
    position = "left",
    mappings = {
      ["l"] = "open",       -- expand a folder, or open a file
      ["h"] = "close_node", -- collapse the folder
    },
  },
  filesystem = {
    filtered_items = { visible = true }, -- show hidden files, dimmed
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
