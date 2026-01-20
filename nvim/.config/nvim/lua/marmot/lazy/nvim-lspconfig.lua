return {
    'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
	},
	config = function()
		local lspconfig_defaults = require('lspconfig').util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)
		local cmp = require('cmp')

		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
			},
			mapping = cmp.mapping.preset.insert({
				-- Navigate between completion items
				['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
				['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({select = false}),
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
		})
	end
}
