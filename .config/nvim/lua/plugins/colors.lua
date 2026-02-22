return {
  "sleeps21/nvim-hellwal-theme",
  priority = 1000,
  config = function()
    require("hellwal").setup()
    vim.cmd("colorscheme hellwal")
  end,
}
