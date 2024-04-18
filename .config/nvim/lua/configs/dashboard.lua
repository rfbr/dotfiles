local options = {
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
  },
}
require("dashboard").setup(options)
