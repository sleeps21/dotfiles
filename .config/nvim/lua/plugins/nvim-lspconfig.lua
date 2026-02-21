-- LSP Support
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
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    require("mason-lspconfig").setup({
      ensure_installed = {
        -- Shell
        "bashls",
        -- Web development
        "html",
        "emmet_language_server",
        "cssls",

        -- Formats
        "jsonls",

        -- Lua development
        "lua_ls",

        -- Python development
        "pyright",
        "ruff",

        -- C/C++ development
        "clangd",
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end,
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Python
        "black",
        "debugpy",
        "mypy",
        "isort",
        -- Django
        "djlint",
        -- Lua
        "stylua",
      },
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
