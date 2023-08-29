vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "



-- Navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Esc remap
keymap("t", "<ESC>", "<C-\\><C-n>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)
keymap("t", "kj", "<ESC>", opts)
keymap("c", "kj", "<ESC>", opts)

-- Keep indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Unmap shift K (lua man search)
keymap("", "<S-k>", "<Nop>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<ESC>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<ESC>:m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<leader>p", [["_dp"]], opts)

-- Telescope
keymap('n', '<leader>ff', ":Telescope find_files<cr>", opts)
keymap('n', '<leader>fg', ":Telescope live_grep<cr>", {})
keymap('n', '<leader>fb', ":Telescope buffers<cr>", {})
keymap('n', '<leader>fh', ":Telescope help_tags<cr>", {})
keymap('n', '<leader>fo', ":Telescope oldfiles<cr>", {})
keymap('n', '<leader>fb', ":Telescope filebrowser<cr>", {})
keymap('n', '<leader>cs', ":Telescope colorsheme<cr>", {})

keymap('n', '<leader>bj', ":BufferLinePick<cr>", opts)

vim.keymap.set("n", "<leader>cf", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>:NvimTreeToggle<cr>", {
  silent = true,
  noremap = true,
  desc = "open init.lua",
})

local keymap_lsp = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap_lsp("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap_lsp({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap_lsp("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap_lsp("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap_lsp("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap_lsp("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap_lsp("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap_lsp("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap_lsp("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap_lsp("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
keymap_lsp("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap_lsp("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap_lsp("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap_lsp("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap_lsp("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap_lsp("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap_lsp("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap_lsp("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap_lsp("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap_lsp("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap_lsp({"n", "t"}, "<leader>\\", "<cmd>Lspsaga term_toggle<CR>")

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require('nvim-ts-autotag').setup()
