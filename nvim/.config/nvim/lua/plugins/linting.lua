return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d"}, --"unused_signal_linter"
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
        }
        --
        -- lint.linters.unused_signal_linter = {
        --     cmd = "bash", -- No external command needed; we'll use Lua
        --     stdin = false,
        --     args = {},
        --     stream = "stdout",
        --     ignore_exitcode = true,
        --     parser = function(_, bufnr)
        --         local diagnostics = {}
        --
        --         local signal_pattern = "([a-zA-Z0-9_]+)%s*=%s*signal%s*%<?([^>]*)%>?%("
        --         local computed_pattern = "([a-zA-Z0-9_]+)%s*=%s*computed%s*%<?([^>]*)%>?%("
        --         local input_pattern = "([a-zA-Z0-9_]+)%s*=%s*input%s*%<?([^>]*)%>?%("
        --
        --         -- TODO: I need to find all the usages of each of the signals and check
        --         -- if they are being called and they are not being set or assigned
        --         -- Look both in the typescript file and the html file (if there is one)
        --         local calls_pattern = "([a-zA-Z0-9_]+)%("
        --
        --         local signals = {}
        --         local computed_signals = {}
        --         local inputs = {}
        --         local calls = {}
        --
        --         -- Read file contents
        --         local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        --
        --         for line_num, line in ipairs(lines) do
        --             for signal in line:gmatch(signal_pattern) do
        --                 signals[signal] = line_num
        --             end
        --             for computed in line:gmatch(computed_pattern) do
        --                 computed_signals[computed] = line_num
        --             end
        --             for input in line:gmatch(input_pattern) do
        --                 inputs[input] = line_num
        --             end
        --             for call in line:gmatch(calls_pattern) do
        --                 calls[call] = true
        --             end
        --         end
        --
        --         -- Check for unused signals
        --         for signal, line_num in pairs(signals) do
        --             if not calls[signal] then
        --                 table.insert(diagnostics, {
        --                     lnum = line_num - 1, -- Lua index starts at 1, but diagnostics use 0-based indexing
        --                     col = 0,
        --                     message = "Signal '" .. signal .. "' is declared but never called.",
        --                     severity = vim.diagnostic.severity.WARN,
        --                     source = "unused_signal_linter",
        --                 })
        --             end
        --         end
        --
        --         -- Check for unused computed
        --         for computed, line_num in pairs(computed_signals) do
        --             if not calls[computed] then
        --                 table.insert(diagnostics, {
        --                     lnum = line_num - 1, -- Lua index starts at 1, but diagnostics use 0-based indexing
        --                     col = 0,
        --                     message = "Computed Signal '" .. computed .. "' is declared but never called.",
        --                     severity = vim.diagnostic.severity.WARN,
        --                     source = "unused_signal_linter",
        --                 })
        --             end
        --         end
        --
        --         -- Check for unused signal inputs
        --         for input, line_num in pairs(inputs) do
        --             if not calls[input] then
        --                 table.insert(diagnostics, {
        --                     lnum = line_num - 1, -- Lua index starts at 1, but diagnostics use 0-based indexing
        --                     col = 0,
        --                     message = "Input Signal '" .. input .. "' is declared but never called.",
        --                     severity = vim.diagnostic.severity.WARN,
        --                     source = "unused_signal_linter",
        --                 })
        --             end
        --         end
        --
        --         return diagnostics
        --     end,
        -- }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
