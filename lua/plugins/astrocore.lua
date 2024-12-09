-- if true then return {} end -- warn: remove this line to activate this file

-- astrocore provides a central place to modify mappings, vim options, autocommands, and more!
-- configuration documentation can be found with `:h astrocore`
-- note: we highly recommend setting up the lua language server (`:lspinstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type lazyspec
return {
	"astronvim/astrocore",
	---@type astrocoreopts
	opts = {
		autocmds = {
			newline_char = {
				{
					event = { "VimEnter", "BufNew" },
					pattern = "*",
					command = "set list listchars=tab:»\\ ,trail:·,eol:↲",
				},
			},
		},
		-- configure core features of astronvim
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight urls at start
			notifications = true, -- enable notifications at start
		},
		-- diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true, -- sets vim.opt.number
				spell = false, -- sets vim.opt.spell
				signcolumn = "yes", -- sets vim.opt.signcolumn to yes
				wrap = false, -- sets vim.opt.wrapreturn {
				showtabline = 4,
				shiftwidth = 4,
				tabstop = 4,
				colorcolumn = "80",
			},
			g = { -- vim.g.<key>
				-- configure global vim variables (vim.g)
				-- note: `mapleader` and `maplocalleader` must be set in the astronvim opts or before `lazy.setup`
				-- this can be found in the `lua/lazy_setup.lua` file
			},
		},
		-- mappings can be configured through astrocore as well.
		-- note: keycodes follow the casing in the vimdocs. for example, `<leader>` must be capitalized
		mappings = {
			-- first key is the mode
			n = {
				-- second key is the lefthand side of the map

				-- navigate buffer tabs
				["L"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count1)
					end,
					desc = "next buffer",
				},
				["H"] = {
					function()
						require("astrocore.buffer").nav(-vim.v.count1)
					end,
					desc = "previous buffer",
				},

				-- mappings seen under group name "buffer"
				["<leader>bd"] = {
					function()
						require("astroui.status.heirline").buffer_picker(function(bufnr)
							require("astrocore.buffer").close(bufnr)
						end)
					end,
					desc = "close buffer from tabline",
				},

				-- tables with just a `desc` key will be registered with which-key if it's installed
				-- this is useful for naming menus
				-- ["<leader>b"] = { desc = "buffers" },

				-- setting a mapping to false will disable it
				-- ["<c-s>"] = false,
			},
			v = {
				["p"] = { "P" },
			},
			-- i = {
			--   -- map copilot's tab completion to <c-l>
			--   ["<c-l>"] = { 'copilot#accept("\\<cr>")' },
			--
			-- }
		},
	},
}