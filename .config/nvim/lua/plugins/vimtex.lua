return {
  {
    "lervag/vimtex",
    lazy = false, -- Load VimTeX on startup
    config = function()
      -- Enable syntax and filetype-related features
      vim.cmd([[
        filetype plugin indent on
        syntax enable
      ]])
    end,
  },
}
