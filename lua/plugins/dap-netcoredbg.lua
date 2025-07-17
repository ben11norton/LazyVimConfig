return {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
        local dap = require("dap")
        if not dap.adapters["netcoredbg"] then
            dap.adapters["netcoredbg"] = {
                type = "executable",
                command = "C:\\Dev\\tools\\netcoredbg\\netcoredbg.exe", -- hardcoded path here
                args = { "--interpreter=vscode" },
                options = {
                    detached = false,
                },
            }
        end

        for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
            if not dap.configurations[lang] then
                dap.configurations[lang] = {
                    {
                        type = "netcoredbg",
                        name = "Launch .NET App",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "\\bin\\Debug\\net7.0\\", "file")
                        end,
                        cwd = "${workspaceFolder}",
                        stopAtEntry = false,
                    },
                }
            end
        end
    end,
}
