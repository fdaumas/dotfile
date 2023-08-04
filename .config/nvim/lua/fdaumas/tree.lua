require("nvim-tree").setup({
	on_attach = on_attach,
	sort_by = "case_sensitive",
	hijack_cursor = true,
	view = {
		width = 30,
		hide_root_folder = false,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = "true",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				edge   = "│",
				item   = "│",
				corner = "╰",
				bottom = "─",
				none   = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					arrow_closed = "│",
					arrow_open   = "├",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},

				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
	},
})

require 'nvim-tree.view'.View.winopts.number = true
