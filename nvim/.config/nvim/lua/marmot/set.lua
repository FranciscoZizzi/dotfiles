vim.opt.clipboard = 'unnamedplus'

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false -- Tabs instead of spaces
vim.opt.smartindent = false

-- Override settings for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "haskell" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true -- Ensure spaces for these file types
  end
})

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'
