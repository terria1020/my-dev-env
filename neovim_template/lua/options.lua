local opt = vim.opt

opt.number = true
opt.relativenumber = false

opt.cursorline = true
opt.scrolloff = 5

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false
opt.encoding = "utf-8"
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.undofile = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.wrap = false
  end,
})
