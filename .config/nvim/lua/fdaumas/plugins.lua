local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- lsp
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},

	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({
				ui = {
					kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				},
			})
		end,
	},
	-- -- motion
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
				require("flash").jump({
					search = {
						mode = function(str)
							return "\\<" .. str
						end,
					}
				})
				end,
				desc = "Flash"
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter()
				end,
				desc = "Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote()
				end,
				desc = "Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search()
				end,
				desc = "Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle()
				end,
				desc = "Toggle Flash Search"
			},
		},
	},
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- python
	"deoplete-plugins/deoplete-jedi",

	-- theme
	{ "catppuccin/nvim", name = "catppuccin" },

	{ "lukas-reineke/indent-blankline.nvim" },


	"nvim-lua/plenary.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
			filetypes = {
				'html', 'javascript', 'typescript', 'javascriptreact',
				'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
				'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars',
				'hbs'
			},
		}
	},

	{ "windwp/nvim-ts-autotag" },


	"nvim-tree/nvim-tree.lua",
	"nvim-telescope/telescope.nvim",
	{ 'akinsho/bufferline.nvim', tag = "v3.0.0" },
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	'numToStr/Comment.nvim',

	-- no mandatory
	"norcalli/nvim-colorizer.lua",
	"startup-nvim/startup.nvim",
	"andweeb/presence.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
}

local opts = {}

require("lazy").setup(plugins, opts)



--    Old text                    Command         New text
--------------------------------------------------------------------------------
--  surr*ound_words             ysiw)           (surround_words)
--  *make strings               ys$"            "make strings"
--  [delete ar*ound me!]        ds]             delete around me!
--  remove <b>HTML t*ags</b>    dst             remove HTML tags
--  'change quot*es'            cs'"            "change quotes"
--  <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--  delete(functi*on calls)     dsf             function calls
