-- When nvim-treesitter is updated, update the parsers too
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- Parsers to install: add the languages you use
require("nvim-treesitter").install({
  "bash", "c", "lua", "markdown", "markdown_inline", "toml", "vim", "vimdoc",
})

-- Turn on treesitter highlighting for every file that has a parser
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
