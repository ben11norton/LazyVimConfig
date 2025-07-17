return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")

            if not dap.adapters.netcoredbg then
                dap.adapters.netcoredbg = {
                    type = "executable",
                    command = "C:\\Dev\\tools\\netcoredbg\\netcoredbg.exe",
                    args = { "--interpreter=vscode" },
                    options = { detached = false },
                }
            end

            for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
                dap.configurations[lang] = dap.configurations[lang] or {
                    {
                        type = "netcoredbg",
                        name = "Launch file",
                        request = "launch",
                        program = "C:\\Users\\Ben Norton\\source\\repos\\CDRS\\MVC\\bin\\Debug\\net8.0\\MVC.dll",
                        -- program = function()
                        --     return vim.fn.input(
                        --     "C:\\Users\\Ben Norton\\source\\repos\\CDRS\\MVC\\bin\\Debug\\net8.0\\MVC.dll",
                        --         vim.fn.getcwd() .. "\\", "file")
                        -- end,
                        cwd = "${workspaceFolder}",
                    },
                }
            end
        end,
    },

    -- Required by nvim-dap-ui
    {
        "nvim-neotest/nvim-nio",
    },

    -- DAP UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
