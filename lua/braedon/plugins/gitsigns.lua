return {
	"lewis6991/gitsigns.nvim",
	-- NOTE: this is an odd setup gs may be uniquely weird about this
	config = function()
		local gs = require("gitsigns")
		gs.setup({})

		vim.keymap.set("n", "<leader>ib", gs.toggle_current_line_blame)
	end,
}
