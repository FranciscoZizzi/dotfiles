return {
    "williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry", -- The default one
				"github:Crashdummyy/mason-registry", -- The Roslyn source
			},
		})
	end
}
