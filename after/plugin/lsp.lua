local lsp_zero = require("lsp-zero")
vim.lsp.set_log_level("debug")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer', 'pylsp', 'lua_ls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>g", "<cmd>Telescope diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<leader>vh", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
end)

-- require'lspconfig'.pylsp.setup({
--     cmd = {"pylsp"},
--     filetypes = {"python"},
-- 	settings = {
-- 		pylsp = {
--             on_attach = on_attach,
-- 			plugins = {
-- 				flake8 = { enabled = false, maxLineLength = 140 },
-- 				pycodestyle = { enabled = false },
-- 				mccabe = { enabled = false },
-- 				pyflakes = { enabled = false },
-- 			},
--             configurationSources = { "flake8" },
-- 		},
-- 	},
-- })

-- require'lspconfig'.pylsp.setup {
--   settings = {
--     pylsp = {
--       configurationSources = {"flake8"},
--       plugins = {
--         jedi_completion = {enabled = true},
--         jedi_hover = {enabled = true},
--         jedi_references = {enabled = true},
--         jedi_signature_help = {enabled = true},
--         jedi_symbols = {enabled = true, all_scopes = true},
--         pycodestyle = {enabled = false},
--         flake8 = {
--           enabled = true,
--           ignore = {},
--           maxLineLength = 140
--         },
--         mypy = {enabled = false},
--         isort = {enabled = false},
--         yapf = {enabled = false},
--         pylint = {enabled = false},
--         pydocstyle = {enabled = false},
--         mccabe = {enabled = false},
--         preload = {enabled = false},
--         rope_completion = {enabled = false}
--       }
--     }
--   },
-- }


-- This function is for configuring a buffer when an LSP is attached
local on_attach = function(client, bufnr)
    -- Always show the signcolumn, otherwise it would shift the text each time
    -- diagnostics appear/become resolved
    vim.o.signcolumn = 'yes'

    -- Update the cursor hover location every 1/4 of a second
    vim.o.updatetime = 250

    -- Disable appending of the error text at the offending line
    vim.diagnostic.config({ virtual_text = false })

    -- Enable a floating window containing the error text when hovering over an error
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })

    -- This setting is to display hover information about the symbol under the cursor
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
end
-- Setup the Unison LSP
require('lspconfig')['unison'].setup {
    on_attach = on_attach,
}
-- local cmp_mappings = lsp_zero.defaults.cmp_mappings({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
-- })

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
--
-- lsp_zero.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })
--
-- lsp_zero.set_preferences({
--     suggest_lsp_servers = true,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })

vim.diagnostic.config({
    virtual_text = true,
})

local util = require('lspconfig.util')
require("lspconfig").pylsp.setup {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                jedi_completion = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true, all_scopes = true },
                pycodestyle = { enabled = false },
                flake8 = {
                    enabled = true,
                    ignore = {},
                    maxLineLength = 100
                },
                mypy = { enabled = false },
                black = { enabled = true },
                isort = { enabled = false },
                yapf = { enabled = false },
                pylint = { enabled = false },
                pydocstyle = { enabled = false },
                mccabe = { enabled = false },
                preload = { enabled = false },
                rope_completion = { enabled = true }
            },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
}

require('lspconfig').jdtls.setup({})
