return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.7",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                        },
                    },
                },
            })

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            -- See `:help telescope.builtin`
            vim.keymap.set(
                "n",
                "<leader>?",
                require("telescope.builtin").oldfiles,
                { desc = "[?] Find recently opened files" }
            )
            vim.keymap.set(
                "n",
                "<leader><space>",
                require("telescope.builtin").buffers,
                { desc = "[ ] Find existing buffers" }
            )
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer]" })

            vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set(
                "n",
                "<leader>sw",
                require("telescope.builtin").grep_string,
                { desc = "[S]earch current [W]ord" }
            )
            vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set(
                "n",
                "<leader>sd",
                require("telescope.builtin").diagnostics,
                { desc = "[S]earch [D]iagnostics" }
            )
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            telescope.load_extension("ui-select")
        end,
    },
}
