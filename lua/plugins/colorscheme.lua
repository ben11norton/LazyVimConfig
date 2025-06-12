return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main",
      dark_variant = "main",
      highlight_groups = {
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#000000" },
      },
      styles = {
        italic = false
      },
      before_highlight = function (group, highlight, palette)
        -- change color pallete:
        if highlight.fg == palette.iris then
            highlight.fg = palette.rose
        elseif highlight.fg == palette.foam then
            highlight.fg = palette.text
        elseif highlight.fg == palette.pine then
            highlight.fg = palette.love
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
