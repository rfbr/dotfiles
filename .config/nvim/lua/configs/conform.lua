local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff_format" },
    yaml = { "yamlfix" },
    c = { "clang_format" },
  },
  formatters = {
    yamlfix = {
      env = {
        YAMLFIX_EXPLICIT_START = "false",
      },
    },
    clang_format = {
      prepend_args = { "--style=file", "--fallback-style=LLVM" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
