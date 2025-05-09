local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Search files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search git files" })
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search files for string" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search help" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Search keymaps" })
