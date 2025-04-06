return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    config = function()
        local telescope = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function()
            telescope.find_files({})
        end)
        vim.keymap.set("n", "<leader>ps", function()
            telescope.live_grep({})
        end)
        vim.keymap.set("n", "<leader>r", function()
            telescope.oldfiles({})
        end)

        vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Find files tracked by Git" })
    end
}
