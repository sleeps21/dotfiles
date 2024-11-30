return {

  -- https://github.com/mfussenegger/nvim-dap-python
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- Update the path passed to setup to point to your system or virtual env python binary
    local dap = require("dap")
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
    require("dap-python").setup("/home/sleeps/miniconda3/bin/python")
  end,
}
-- config = function()
--   local dap = require("dap")
--   local dap_python = require("dap-python")

--   -- Key mappings for debugging
--   vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
--   vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
--   vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
--   vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
--   vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
--   vim.keymap.set("n", "<Leader>B", function()
--     dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
--   end, { desc = "Set Conditional Breakpoint" })
--   vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open Debugger REPL" })
--   vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last Debugging Session" })

--   -- Set up the Python debugger with the correct path
--   dap_python.setup("/home/sleeps/miniconda3/bin/python")
-- end,
