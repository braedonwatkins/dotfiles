vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>db", ":DiffviewOpen origin/main...HEAD<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dr", ":DiffviewOpen --rebase<CR>", { noremap = true, silent = true })

return {
    "sindrets/diffview.nvim",
}
