return {
  dir = "~/code/plugins/colors.nvim/",
  name = "colors",
  config = function(_, opts)
    require("colors").setup(opts)
  end,
}
