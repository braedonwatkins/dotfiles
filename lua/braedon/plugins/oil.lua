return {
  "stevearc/oil.nvim",
  opts = {
  },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil" },
    { "<leader>tc", function()
        local oil = require("oil")
        local visible = vim.g.oil_columns_visible or true
        vim.g.oil_columns_visible = not visible

        oil.setup({
          columns = visible
            and { "icon" }
            or { "icon", "permissions", "size", "mtime", "uid" }
        })
        vim.cmd("edit")
      end,
      desc = "Toggle Oil Columns"

    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },

  lazy = false,
}

