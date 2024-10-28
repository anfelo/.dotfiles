return {
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     config = function()
    --         require("treesitter-context").setup()
    --     end,
    -- },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-treesitter.configs").setup({})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
}
