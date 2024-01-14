return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = {"jk","kj","jj"},
    },
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.completion.copilot-lua" },
    {
      "copilot.lua",
      opts = {
        suggestion = {
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<C-.>",
            prev = "<C-,>",
            dismiss = "<C/>",
          },
        },
      },
    },
  },
  "p00f/clangd_extensions.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" },
    },
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true
      }
    end,
    lazy = false,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.winbar = nil
      return opts
    end
  },
  {
    "kassio/neoterm",
    lazy = false,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()'
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "./lua/user/snippets" }
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          -- hide_dotfiles = false,
          -- hide_gitignored = false,
        },
      },
    },
  }
}
