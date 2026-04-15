return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "rust",
        "java",
        "yaml",
        "json",
        "markdown",
        "bash",
      },
      auto_install = true,
    })
  end,
}
