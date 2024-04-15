local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show harpoon files" })

vim .keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Goto harpoon 1" })
vim .keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = "Goto harpoon 2" })
vim .keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = "Goto harpoon 3" })
vim .keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = "Goto harpoon 4" })
