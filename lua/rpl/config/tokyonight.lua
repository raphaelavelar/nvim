return {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
        vim.cmd [[colorscheme tokyonight]]

        require('tokyonight').setup({
            style = 'storm',
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = 'dark',
                floats = 'dark',
            },
            sidebars = { 'qf', 'help' },
            hide_inactive_statusline = false,
            dim_inactive = false,
            lualine_bold = false,
        })
    end
}