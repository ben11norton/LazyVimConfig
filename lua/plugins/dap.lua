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
                        -- Important note
                        -- if breakpoints are not hitting then run ':set noshellslash'
                        -- program = function()
                        --     local filePath = vim.fn.getcwd()
                        --     local cleanedFilePath = filePath:gsub('/', '\\')
                        --     return vim.fn.input('Path to dll: ', cleanedFilePath .. '\\bin\\Debug\\net8.0\\MVC.dll',
                        --         'file')
                        -- end,
                        cwd = "${workspaceFolder}",
                        env = {
                            ASPNETCORE_ENVIRONMENT = "Development"
                        },
                        stopAtEntry = false,
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
