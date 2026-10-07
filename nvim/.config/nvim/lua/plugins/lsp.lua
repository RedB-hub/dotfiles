vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup()

-- Lua: tell the Lua server that `vim` exists, so your config files show no false errors
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

-- Language servers to install: clangd for C/C++, lua_ls for Lua
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "lua_ls" },
})

-- Show error messages at the end of the line
vim.diagnostic.config({ virtual_text = true })

-- Go to definition (Neovim's default, Ctrl+], is awkward on a French keyboard)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
