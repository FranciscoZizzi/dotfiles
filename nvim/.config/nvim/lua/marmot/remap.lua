vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, desc = 'Map :update to <leader>w' })

local builtin = require('telescope.builtin')

-- Telescope motions
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
  augroup end
]], false)

-- Copy current buffer's path to clipboard
vim.keymap.set('n', '<leader>cp', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  print("Copied buffer path: " .. vim.fn.expand('%'))
end, { desc = "Copy buffer path to clipboard" })

local gitsigns = require('gitsigns')

local function map(mode, l, r, opts)
	opts = opts or {}
	opts.buffer = bufnr
	vim.keymap.set(mode, l, r, opts)
end

-- Actions
map('n', '<leader>hs', gitsigns.stage_hunk)
map('n', '<leader>hr', gitsigns.reset_hunk)
map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('n', '<leader>hS', gitsigns.stage_buffer)
map('n', '<leader>hu', gitsigns.undo_stage_hunk)
map('n', '<leader>hR', gitsigns.reset_buffer)
map('n', '<leader>hp', gitsigns.preview_hunk)
map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
map('n', '<leader>hd', gitsigns.diffthis)
map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
map('n', '<leader>td', gitsigns.toggle_deleted)

-- Text object
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

