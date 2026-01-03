-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  -- hl_override = {
  --     Comment = { italic = true },
  --     ["@comment"] = { italic = true },
  -- },
}

M.lsp = { signature = false }

M.mason = {
  pkgs = {
    -- lua
    "lua-language-server",
    "stylua",
    -- python
    "isort",
    "pyright",
    "ruff",
    -- yaml
    "yamlfix",
    -- cpp
    "clangd",
    "clang-format",
    -- rust
    "rust-analyzer",
  },
}

return M
