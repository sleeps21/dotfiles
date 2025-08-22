return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- fancy icons
    "linrongbin16/lsp-progress.nvim", -- LSP loading progress
  },

  opts = {
    options = {
      icons_enabled = true,
      theme = "colors-nvim",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true, -- important
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        "mode",
        "branch",
        "diagnostics",
        { "filename", path = 1 },
        "filetype", -- fixed typo
        "progress",
        "location",
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {},
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },

  config = function(_, opts)
    vim.opt.laststatus = 3
    require("lualine").setup(opts)

    -- Hide per-window statusline in NvimTree and prevent dark bar
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.opt_local.statusline = " "
        vim.wo.winhighlight = "StatusLine:NvimTreeNormal,StatusLineNC:NvimTreeNormal"
      end,
    })

    -- Ensure transparent statusline in the tree
    vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "NONE", fg = "NONE" })

    -- Optional, remove end-of-buffer tildes that look like a block
    vim.opt.fillchars:append({ eob = " " })
  end,
}
