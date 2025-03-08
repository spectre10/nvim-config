-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

	-- == Examples of Adding Plugins ==

	"andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- == Examples of Overriding Plugins ==

	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				-- " █████  ███████ ████████ ██████   ██████",
				-- "██   ██ ██         ██    ██   ██ ██    ██",
				-- "███████ ███████    ██    ██████  ██    ██",
				-- "██   ██      ██    ██    ██   ██ ██    ██",
				-- "██   ██ ███████    ██    ██   ██  ██████",
				-- " ",
				-- "    ███    ██ ██    ██ ██ ███    ███",
				-- "    ████   ██ ██    ██ ██ ████  ████",
				-- "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
				-- "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
				-- "    ██   ████   ████   ██ ██      ██",
			}
			return opts
		end,
	},
	{
		"max397574/better-escape.nvim",
		enabled = true,
		opts = {
			mappings = {
				i = {
					j = {
						k = "<Esc>",
					},
					k = {
						j = "<Esc>",
					},
				},
			},
		},
	},

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
						-- don't add a pair if the next character is %
						:with_pair(cond.not_after_regex("%%"))
						-- don't add a pair if  the previous character is xxx
						:with_pair(
							cond.not_before_regex("xxx", 3)
						)
						-- don't move right when repeat character
						:with_move(cond.none())
						-- don't delete if the next character is xx
						:with_del(cond.not_after_regex("xx"))
						-- disable adding a newline when you press <cr>
						:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			-- background_opacity = 0.8,
			-- icons = {
			--   ERROR = "",
			--   WARN = "",
			--   INFO = "",
			--   DEBUG = "",
			--   TRACE = "✎",
			-- },
		},
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- "ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
		},
	},
	{
		"kassio/neoterm",
		lazy = false,
	},
}
