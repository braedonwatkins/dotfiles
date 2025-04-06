vim.keymap.set("n", "<leader>gs", function()
    vim.cmd((vim.bo.filetype == "fugitive") and "bd" or "Git")
end)

return {
    "tpope/vim-fugitive",
}
