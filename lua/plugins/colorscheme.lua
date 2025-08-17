return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "main",
            dark_variant = "main",
            highlight_groups = {
                -- Base backgrounds
                Normal                 = { bg = "#161A21" },
                NormalNC               = { bg = "#161A21" },
                NormalFloat            = { bg = "#161A21" },

                -- Floating windows and borders
                FloatBorder            = { bg = "#161A21" },
                FloatTitle             = { bg = "#161A21" },

                -- LazyVim plugin UIs
                LazyNormal             = { bg = "#161A21" },
                MasonNormal            = { bg = "#161A21" },

                -- Telescope
                TelescopeNormal        = { bg = "#161A21" },
                TelescopeBorder        = { bg = "#161A21" },
                TelescopePromptNormal  = { bg = "#161A21" },
                TelescopePromptBorder  = { bg = "#161A21" },
                TelescopePromptTitle   = { bg = "#161A21" },
                TelescopeResultsTitle  = { bg = "#161A21" },
                TelescopePreviewTitle  = { bg = "#161A21" },

                -- WhichKey popup
                WhichKeyFloat          = { bg = "#161A21" },

                -- Completion menu (nvim-cmp)
                Pmenu                  = { bg = "#161A21" },
                CmpDocumentation       = { bg = "#161A21" },
                CmpDocumentationBorder = { bg = "#161A21" },
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
                    highlight.fg = "#e3c8ec"
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
