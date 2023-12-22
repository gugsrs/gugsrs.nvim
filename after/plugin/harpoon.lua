local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Create Harpoon anchor" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon quick menu" })

vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end, { desc = "Select 1st Harpoon anchor" })
vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end, { desc = "Select 2nd Harpoon anchor"})
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Select 3rd Harpoon anchor" })
vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end, { desc = "Select 4rd Harpoon anchor" })
