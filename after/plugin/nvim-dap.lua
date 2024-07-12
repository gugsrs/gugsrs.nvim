local dap = require("dap")
dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
    }
}

vim.keymap.set("n", "<leader>b", ": lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dn", ": lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>do", ": lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dq", ": lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>di", ": lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>dr", ": lua require'dap'.repl_open()<CR>")
vim.keymap.set("n", "<leader>dc", ": lua require'dap'.disconnect()<CR>")
vim.keymap.set("n", "<leader>dt", ": lua require'dapui'.toggle()<CR>")
--
-- local dapui = require("dapui")
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
