return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- fancy icons
    "linrongbin16/lsp-progress.nvim", -- LSP loading progress
  },

  opts = {
    options = {

      icons_enabled = true,
      -- theme = "pywal16-nvim",
      theme = "colors-nvim",
      component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
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
        "fileytype",
        "progress",
        "location",
      },
      lualine_b = {},
      -- lualine_b = { "branch", "", "diagnostics" }, --"diff", "diagnostics" },
      lualine_c = {},
      -- lualine_c = { { "filename", path = 1 } },
      -- lualine_x = { "filetype" }, -- "encoding", "fileformat",
      lualine_x = {}, -- "encoding", "fileformat",
      lualine_y = {},
      -- lualine_y = { "progress" },
      -- lualine_z = { "location" },
      lualine_z = {},
    },
    inactive_sections = {},
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}

--   dependencies = {
--     "nvim-tree/nvim-web-devicons",  -- fancy icons
--     "linrongbin16/lsp-progress.nvim", -- LSP loading progress
--   },
--   opts = {
--     options = {
--       theme = "pywal16-nvim", -- "pywal16-nvim, auto, tokyonight, catppuccin, codedark, nord"
--     },
--     sections = {
--       lualine_c = {
--         {
--           "filename",
--           file_status = true, -- Displays file status (readonly status, modified status)
--           newfile_status = false, -- Display new file status (new file means no write after created)
--           path = 4,          -- 0: Just the filename
--           -- 1: Relative path
--           -- 2: Absolute path
--           -- 3: Absolute path, with tilde as the home directory
--           -- 4: Filename and parent dir, with tilde as the home directory
--           symbols = {
--             modified = "[+]", -- Text to show when the file is modified.
--             readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
--           },
--         },
--       },
--     },
--   },
-- }
