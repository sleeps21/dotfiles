return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- Update the Python path to point to the Conda base environment
    require("dap-python").setup("/home/sleeps/miniconda3/bin/python")
  end,
}
