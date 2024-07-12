local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
require("telescope").load_extension("recent_files")
require("telescope").load_extension("file_browser")

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"]   = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>w', builtin.grep_string, {})
vim.api.nvim_set_keymap("n", "<leader>pr",
    [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    "n",
    "<space>n",
    ":Telescope file_browser<CR>",
    { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<space>nm",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
