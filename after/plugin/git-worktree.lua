require("git-worktree").setup({})

require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<leader>gw', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it  [W]orktrees' })
vim.keymap.set('n', '<leader>gwc', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it  [W]orktree [C]reate' })
