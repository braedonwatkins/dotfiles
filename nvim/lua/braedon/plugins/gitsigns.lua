return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")
        gs.setup({})

        vim.keymap.set("n", "<leader>ib", gs.toggle_current_line_blame)
    end,
}
