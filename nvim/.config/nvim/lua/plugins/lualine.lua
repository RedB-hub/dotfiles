vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
    -- setting theme. Considered : ayu_mirage / codedark / base16 / everforest / gruvbox-material / iceberg_dark / papercolor_dark
    options = { theme = 'auto' }
}
