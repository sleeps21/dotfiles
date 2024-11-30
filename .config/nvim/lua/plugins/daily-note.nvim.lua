-- lua/plugins/daily-note.lua
return {
  dir = "~/code/plugins/daily-note.nvim/",
  config = function()
    require("daily_note").setup()
  end,
}
