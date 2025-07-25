-- Documentation for changing the dash: 
-- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
        Wosson then Pard
        ]],
        keys = {
          --once we have too much time 
          --on our hands we can make some cool keys here
        },
        -- below in this sections object we can put stuff like recent files or projects 
        -- as shown in the docs linked above :)
        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1, padding = 1 },
        --   { section = "startup" },
        -- },
      },
    },
  },
}
