return {
	"AstroNvim/astrocommunity",
	-- { import = "astrocommunity.recipes.ai" },
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
			filetypes = {
				cpp = false,
				["c++"] = false,
			},
		},
	},
	-- { import = "astrocommunity.completion.copilot-lua-cmp" },
	{ import = "astrocommunity.editing-support.vim-visual-multi" },
	{
		"mg979/vim-visual-multi",
		config = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_leader = "<Leader>m"
			vim.g.VM_maps = {
				select = "v",
				select_line = "V",
				-- select_word = "<C-n>",
				add_cursor = "<C-n>",
				remove_cursor = "<C-x>",
				-- jump_to_next = "<C-n>",
				-- jump_to_prev = "<C-p>",
			}
		end,
	},
	{ import = "astrocommunity.pack.go" }
}
