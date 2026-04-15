return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus explorer" },
  },
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        icon = {
          folder_closed = "[+]",
          folder_open = "[-]",
          folder_empty = "[ ]",
          default = "[F]",
        },
        git_status = {
          symbols = {
            added = "A",
            deleted = "D",
            modified = "M",
            renamed = "R",
            untracked = "?",
            ignored = "I",
            unstaged = "U",
            staged = "S",
            conflict = "!",
          },
        },
      },
      window = { width = 30 },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
      },
    })
  end,
}
