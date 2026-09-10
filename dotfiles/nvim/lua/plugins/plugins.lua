return {
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },

  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "Validate documents",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "Publish Diagnostics",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "pyright",
          },
          opts = { skip = true },
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "yaml-language-server",
        "bash-language-server",
        "pyright",
      },
    },
  },
}
