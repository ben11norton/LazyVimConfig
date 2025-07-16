local lspconfig = require("lspconfig")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {
                    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                    -- You can add extra settings here if you want
                },
            },
        },
    },
}
