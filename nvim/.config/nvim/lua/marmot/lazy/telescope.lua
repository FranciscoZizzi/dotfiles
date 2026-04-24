return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        telescope.setup {
            defaults = {
                file_ignore_patterns = { "^.git/", "node_modules/", "^.clj%-kondo/", ".cache" }, -- Add ignore patterns here
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    mappings = {
                        n = { ["<c-d>"] = actions.delete_buffer }, -- Normal mode mapping
                    }
                }
            }
        }
    end
}

