vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })

require("kanagawa").setup({
  colors = {
    -- Same background for the line-number column as for the text
    theme = { all = { ui = { bg_gutter = "none" } } },
  },
})

vim.cmd.colorscheme("kanagawa-wave")
