local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.go",
  command = "map <C-f> :GoImport<CR>",
  group = format_sync_grp,
})

local compile_cpp = vim.api.nvim_create_augroup("run_cpp", {})
vim.api.nvim_create_autocmd({ "VimEnter", "BufNew" }, {
  pattern = "*.cpp",
  command =
  "map <F9> :lua vim.lsp.buf.format()<CR>:w<CR>:T cd %:p:h && g++ %:p -std=c++17 -fsanitize=undefined -fsanitize=address && ./a.out < input.txt && exit<CR>i",
  group = compile_cpp,
})

return {
  lsp = {
    setup_handlers = {
      -- add custom handler
      clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end
    },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
        cmd = {
          "clangd",
          "--all-scopes-completion",
          "--suggest-missing-includes",
          "--background-index",
          "--pch-storage=disk",
          "--cross-file-rename",
          "--log=info",
          "--completion-style=detailed",
          "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
          "--clang-tidy",
          "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
          "--fallback-style=WebKit",
          "--header-insertion=never",
        },
      },
    },
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
    },
  },
  plugins = {
    {
      "AstroNvim/astrocommunity",
      { import = "astrocommunity.completion.copilot-lua" },
      { -- further customize the options set by the community
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
      -- ... import any community contributed plugins here
    },
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
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
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        -- include the default astronvim config that calls the setup call
        require "plugins.configs.luasnip"(plugin, opts)
        -- load snippets paths
        require("luasnip.loaders.from_vscode").lazy_load {
          -- this can be used if your configuration lives in ~/.config/nvim
          -- if your configuration lives in ~/.config/astronvim, the full path
          -- must be specified in the next line
          paths = { "./lua/user/snippets" }
        }
      end,
    },
  },
}
