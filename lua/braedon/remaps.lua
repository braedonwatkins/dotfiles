vim.keymap.set("n", "<leader>pv", function() 
	local bufnr = vim.fn.bufname('%')
	if vim.bo.filetype == 'oil' then
		vim.cmd('bd')
	else
		vim.cmd("Oil")
	end
end)

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
