vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>", { noremap = true })
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>", { noremap = true })
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>", { noremap = true })
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>", { noremap = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>w", ":w<CR>")

-- opens file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- opens undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- comment toggle
vim.keymap.set("n", "<leader>/", vim.cmd.CommentToggle)
vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<CR>gv")

-- moves highlighted code up and down and reformats
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below but with a space and doesn't move cursor
vim.keymap.set("n", "J", "mzJ`z")
-- page up/down but keeps cursor in one place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- when search skipping keeps the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- don't overwrite paste buffer when pasting over highlight
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- deletes to void instead of default register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- format code using lsp
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- replace all words under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- expands the current file dir
vim.keymap.set("c", '%%', [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]])

