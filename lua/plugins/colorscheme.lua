return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "main",
            dark_variant = "main",
            highlight_groups = {
                Normal = { bg = "#0A0E13" },
                NormalFloat = { bg = "#0A0E13" },
                FloatBorder = { bg = "#0A0E13" },
            },
            styles = {
                italic = false,
                bold = false
            },
            before_highlight = function(group, highlight, palette)
                -- change color pallete:
                if highlight.fg == palette.iris then
                    highlight.fg = palette.rose
                elseif highlight.fg == palette.foam then
                    highlight.fg = palette.text
                elseif highlight.fg == palette.pine then
                    highlight.fg = palette.love
                elseif highlight.fg == palette.love then
                    highlight.fg = "#e85c7a"
                elseif highlight.fg == palette.gold then
                    highlight.fg = "#ff8082"
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

-- rose pine color theme
-- return{
--
--   { "rose-pine/neovim" },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "rose-pine",
--     },
--   },
-- }
