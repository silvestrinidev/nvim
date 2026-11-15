return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    enabled = false,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    config = function()
      require("render-markdown").setup {
        enabled = true,
        file_types = {"markdown"},
        checkbox = {
          unchecked = { icon = "□ " },
          checked = { icon = "■ ", scope_highlight = "Comment" },
        }
      }
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} }
    }
  },

  {
    "mattn/emmet-vim",
    ft = require("configs.emmet").ft,
  },

  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {}
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
   	"nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local opts = require("configs.ts").opts or {}
      if opts.ensure_installed then
        require("nvim-treesitter").install(opts.ensure_installed)
      end
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
