local options = {
  formatters_by_ft = {
    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
