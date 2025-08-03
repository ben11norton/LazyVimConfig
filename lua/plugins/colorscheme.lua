return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "main",
            dark_variant = "main",
            highlight_groups = {
                -- Base backgrounds
                Normal                 = { bg = "#11151A" },
                NormalNC               = { bg = "#11151A" },
                NormalFloat            = { bg = "#11151A" },

                -- Floating windows and borders
                FloatBorder            = { bg = "#11151A" },
                FloatTitle             = { bg = "#11151A" },

                -- LazyVim plugin UIs
                LazyNormal             = { bg = "#11151A" },
                MasonNormal            = { bg = "#11151A" },

                -- Telescope
                TelescopeNormal        = { bg = "#11151A" },
                TelescopeBorder        = { bg = "#11151A" },
                TelescopePromptNormal  = { bg = "#11151A" },
                TelescopePromptBorder  = { bg = "#11151A" },
                TelescopePromptTitle   = { bg = "#11151A" },
                TelescopeResultsTitle  = { bg = "#11151A" },
                TelescopePreviewTitle  = { bg = "#11151A" },

                -- WhichKey popup
                WhichKeyFloat          = { bg = "#11151A" },

                -- Completion menu (nvim-cmp)
                Pmenu                  = { bg = "#11151A" },
                CmpDocumentation       = { bg = "#11151A" },
                CmpDocumentationBorder = { bg = "#11151A" },
            },
            styles = {
                italic = false,
                bold = false
            },
            before_highlight = function(group, highlight, palette)
                -- change color pallete:
                if highlight.fg == palette.iris then
                    highlight.fg = palette.text
                elseif highlight.fg == palette.foam then
                    highlight.fg = "#d8c6e1"
                elseif highlight.fg == palette.pine then
                    highlight.fg = palette.love
                elseif highlight.fg == palette.gold then
                    highlight.fg = "#ea9a97"
                elseif highlight.fg == palette.love then
                    highlight.fg = "#d8c6e1"
                end
            end
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            vim.cmd.colorscheme("rose-pine")
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine",
        },
    },
}

-- poimandres color theme:
-- return{
--
--   { "olivercederborg/poimandres.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "poimandres",
--     },
--   },
-- }
