return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")

            -- only register netcoredbg if it's not already there
            if not dap.adapters.netcoredbg then
                dap.adapters.netcoredbg = {
                    type    = "executable",
                    command = "C:\\Dev\\tools\\netcoredbg\\netcoredbg.exe",
                    args    = { "--interpreter=vscode" },
                    options = { detached = false },
                }
            end

            -- add C#/F#/VB launch configs
            for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
                dap.configurations[lang] = dap.configurations[lang] or {
                    {
                        type    = "netcoredbg",
                        name    = "Launch file",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to dll: ",
                                vim.fn.getcwd() .. "\\",
                                "file")
                        end,
                        cwd     = "${workspaceFolder}",
                    },
                }
            end
        end,
    },
}
