return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', 'ff', function()
            builtin.find_files({
                hidden = true,
                no_ignore = true,
                no_ignore_parent = true
            })
            end, {}
        )
        vim.keymap.set('n', 'gf', function()
            builtin.git_files({
                show_untracked = true
            })
            end, {}
        )
        vim.keymap.set('n', 'gc', function()
            builtin.git_commits({
                show_untracked = true
            })
            end, {}
        )
        vim.keymap.set('n', 'b', builtin.buffers, {})
        vim.keymap.set('n', 'r', builtin.lsp_references, {})
        vim.keymap.set('n', 'gi', function()
            builtin.lsp_implementations({ jump_type = 'tab' })
            end, {}
        )
        vim.keymap.set('n', 'ls', function()
            builtin.lsp_document_symbols({ show_line = true })
            end, {}
        )
        vim.keymap.set('n', 'D', builtin.diagnostics, {})
    end
}