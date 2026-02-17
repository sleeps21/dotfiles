return {
        "nvimtools/none-ls.nvim",
        config = function()
                local null_ls = require("null-ls")
                local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

                -- local function mypy_extra_args()
                --   local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
                --   return { "--python-executable", virtual .. "/bin/python3" }
                -- end

                -- Setup null-ls with the required sources
                null_ls.setup({
                        sources = {
                                -- Web development
                                -- HTML
                                -- null_ls.builtins.formatting.prettier,
                                -- null_ls.builtins.formatting.stylelint,
                                -- JSON
                                null_ls.builtins.formatting.prettier,

                                -- Lua formatting
                                null_ls.builtins.formatting.stylua,

                                -- Python formatting
                                null_ls.builtins.formatting.black.with({
                                        command = "/home/sleeps/.local/share/nvim/mason/bin/black",
                                }),
                                null_ls.builtins.formatting.isort,

                                -- Python diagnostics
                                -- null_ls.builtins.diagnostics.mypy.with({
                                --   extra_args = mypy_extra_args,
                                -- }),
                                -- -- Django
                                null_ls.builtins.diagnostics.djlint,
                                null_ls.builtins.formatting.djlint,

                                -- C/C++

                                null_ls.builtins.formatting.clang_format,
                        },
                        -- Configure auto-formatting on save
                        on_attach = function(client, bufnr)
                                if client.supports_method("textDocument/formatting") then
                                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                                        vim.api.nvim_create_autocmd("BufWritePre", {
                                                group = augroup,
                                                buffer = bufnr,
                                                callback = function()
                                                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                                                end,
                                        })
                                end
                        end,
                })
        end,
}
