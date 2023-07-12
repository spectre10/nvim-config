
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd({"VimEnter","BufNew"}, {
  pattern = "*.go",
  command = "map <C-f> :GoImport<CR>",
  group = format_sync_grp,
})

return {
  mappings = {
    n = {
      ["<F9>"]={ ":lua vim.lsp.buf.format()<CR>:w<CR>:T cd %:p:h && g++ %:p -std=c++17 -fsanitize=undefined -fsanitize=address && ./a.out < input.txt && exit<CR>i " },
    }
  },
  lsp = {
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
    },
  },
  plugins = {
    {
	    "Pocco81/auto-save.nvim",
	    config = function()
		    require("auto-save").setup {
			    enabled=true
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
    { "kassio/neoterm",
      lazy=false,
    },
    {
      "ray-x/go.nvim",
      dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("go").setup()
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
  },
}
