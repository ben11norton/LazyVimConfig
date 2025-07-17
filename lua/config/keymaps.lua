-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- DAP keybindings
local dap = require("dap")

vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "DAP: Step Out" })

vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })

vim.keymap.set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: Set Log Point" })

vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "DAP: Run Last" })
