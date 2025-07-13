return {
    {
        dir = "~/personal/iroh.nvim/",
        config = function()
            require("iroh")

            vim.keymap.set("v", "<leader>it", "<ESC><cmd>lua require('iroh').transform()<CR>")
        end
    },
}
