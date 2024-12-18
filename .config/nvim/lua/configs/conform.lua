local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff_format" },
    yaml = { "yamlfix" },
  },
  formatters = {
    yamlfix = {
      env = {
        YAMLFIX_EXPLICIT_START = "false",
      },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
