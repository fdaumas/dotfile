vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#ed8796 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#eed49f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#a6da95 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#7dc4e4 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#8aadf4 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#c6a0f6 gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
