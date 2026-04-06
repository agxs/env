vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble diagnostics" })
vim.keymap.set("n", "<leader>tr", function() require("trouble").refresh() end, { desc = "Refresh Trouble" })
