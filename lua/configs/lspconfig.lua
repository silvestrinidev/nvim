local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

configs.defaults()

local servers = {
  biome = {},
  cssls = {},
  css_variables = {},
  docker_compose_language_service = {},
  dockerls = {},
  eslint = {},
  html = {},
  -- twig = {},
  intelephense = {},
  jdtls = {},
  jsonls = {},
  jsonld_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
      },
    },
  },
  phpactor = {},
  pyright = {},
  tailwindcss = {},
  vtsls = {
    settings = {
      typescript = {
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true }
        },
      },
      javascript = {
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes ={ enabled = true },
          enumMemberValues = { enabled = true }
        },
      },
    },
  },
  yamlls = {},
  emmet_ls = {
    init_options = {
      html = {
        options = {
          ["output.selfClosingStyle"] = "xhtml",
        },
      },
      jsx = {
        options = {
          ["output.selfClosingStyle"] = "xhtml",
        },
      },
    },
    filetypes = {
      "css",
      "html",
      "twig",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "typescriptreact"
    }
  }
}

for server, config in pairs(servers) do
  vim.lsp.config(server, vim.tbl_extend("force", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }, config))
end

vim.lsp.enable(vim.tbl_keys(servers))
