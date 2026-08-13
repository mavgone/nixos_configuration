return {
  {
    "iruzo/matrix-nvim",
    lazy = true,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },

  {
    "sainnhe/everforest",
    lazy = true,
  },

  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },

  {
    "LazyVim/LazyVim",

    opts = {
      colorscheme = function()
        local file = vim.fn.expand("~/.config/nvim/current-theme")
        local f = io.open(file, "r")

        if not f then
          vim.cmd.colorscheme("matrix")
          return
        end

        local theme = f:read("*l")
        f:close()

        if theme and theme ~= "" then
          vim.cmd.colorscheme(theme)
        else
          vim.cmd.colorscheme("matrix")
        end
      end,
    },

    init = function()
      local theme_file = vim.fn.expand("~/.config/nvim/current-theme")
      local theme_dir = vim.fn.expand("~/.config/nvim")

      local function apply_theme()
        local f = io.open(theme_file, "r")

        if not f then
          return
        end

        local theme = f:read("*l")
        f:close()

        if not theme or theme == "" then
          return
        end

        vim.schedule(function()
          pcall(vim.cmd.colorscheme, theme)
        end)
      end

      local watcher = vim.uv.new_fs_event()

      if not watcher then
        return
      end

      watcher:start(
        theme_dir,
        {},
        vim.schedule_wrap(function(err, filename)
          if err then
            return
          end

          if filename == "current-theme" then
            apply_theme()
          end
        end)
      )
    end,
  },
}
