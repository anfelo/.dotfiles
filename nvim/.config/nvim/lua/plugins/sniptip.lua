return {
    "anfelo/sniptip.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>sl", require("sniptip").list)
        vim.keymap.set("v", "<leader>sa", require("sniptip").add)
    end,
    -- { dir = "~/home/anfelo/personal/sniptip.nvim" },
}
