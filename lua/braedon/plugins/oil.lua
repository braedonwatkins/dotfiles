-- toggle oil
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
end)

-- back out (exit file and cd ..)
vim.keymap.set("n", "-", function()
	vim.cmd("Oil")
end)

-- idk if i want this i could see myself needing it every blue moon
vim.keymap.set("", "<leader>tc", function()
	local oil = require("oil")
	local visible = vim.g.oil_columns_visible or true
	vim.g.oil_columns_visible = not visible

	oil.setup({
		columns = visible and { "icon" } or { "icon", "permissions", "size", "mtime", "uid" },
	})
	vim.cmd("edit")
end)

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
