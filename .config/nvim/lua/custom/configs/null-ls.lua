local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = {
  sources = {
    -- python
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.pylint.with({
          extra_args = {"--max-line-length=120"},
        }),
    null_ls.builtins.formatting.black.with({
          extra_args = {"-l 120", "--preview" },
        }),
    null_ls.builtins.formatting.isort,
    -- cpp
    null_ls.builtins.formatting.clang_format,
    -- js/ts
    require("none-ls.diagnostics.eslint"),
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
