return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "html",
        "emmet_language_server",
        "cssls",
        "jsonls",
        "lua_ls",
        "pyright",
        "ruff",
        "clangd",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "isort",
        "djlint",
        "stylua",
      },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Default config for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Lua specific
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Enable all servers
    vim.lsp.enable({
      "bashls",
      "html",
      "emmet_language_server",
      "cssls",
      "jsonls",
      "lua_ls",
      "pyright",
      "ruff",
      "clangd",
    })

    -- Floating preview borders
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
