return {
    "anfelo/sniptip.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>sl", "<cmd>lua require('sniptip').list()<CR>")
        vim.keymap.set("v", "<leader>sa", "<ESC><cmd>lua require('sniptip').add()<CR>")
    end,
    -- { dir = "~/personal/sniptip.nvim" }
}
