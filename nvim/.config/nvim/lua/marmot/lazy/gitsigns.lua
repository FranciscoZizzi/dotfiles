return {
	"lewis6991/gitsigns.nvim",
	-- Initiated at init.lua, wouldn't work if it wasn't
	config = function ()
		require('gitsigns').setup {}
	end
}
