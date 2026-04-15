vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "Mofiqul/vscode.nvim",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("vscode")
      end,
    },
    { "nvim-lualine/lualine.nvim", opts = { theme = "vscode" } },
    { import = "plugins" },
  },
  install = { colorscheme = { "vscode" } },
  checker = { enabled = true },
})
