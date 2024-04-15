local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search git files" } )
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search files for string" } )
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "Search help" })
vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = "Search keymaps" })
