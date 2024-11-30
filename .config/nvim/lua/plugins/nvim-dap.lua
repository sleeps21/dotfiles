return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "F5",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue Debugger",
      },
      {
        "b",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Add Breakpoint",
      },
      {
        "dl",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate Debugger",
      },
    },
  },
}
