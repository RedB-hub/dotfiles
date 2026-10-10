vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("flash").setup({
  modes = {
    char = {
      jump_labels = true, -- show labels on f/F/t/T matches, like Obsidian
    },
  },
})
