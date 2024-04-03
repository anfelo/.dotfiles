return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent_background = false, -- Enable this to disable setting the background color
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                mason = true,
            },
        })

        vim.o.termguicolors = true
        -- vim.cmd.colorscheme("catppuccin")
    end,
}
