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
local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return 'python'
      end
    end;
  },
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
