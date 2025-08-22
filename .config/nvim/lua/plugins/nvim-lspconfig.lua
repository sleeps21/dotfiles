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
        "rust_analyzer",
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

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- local function on_attach(client, bufnr)
    --   -- Key bindings etc.
    -- end

    -- Configure Lua LS more deeply *after* generic setup

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        diagnostics = {
          globals = { "vim" },
        },
        Lua = {
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- adds Neovim runtime
            checkThirdParty = false,                           -- disables annoying prompts
          },
          telemetry = {
            enable = false, -- privacy
          },
        },
      },
    }) -- Set border on all LSP floating windows
    local orig_util = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util(contents, syntax, opts, ...)
    end
  end,
}
