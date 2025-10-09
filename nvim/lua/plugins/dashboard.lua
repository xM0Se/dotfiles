return {

    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
        theme = 'hyper',
        config = {
            header = {
                "lol if this works iam a genius",
            },
            shortcut = {
                { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope dotfiles',
                    key = 'd',
                },
            },
            center = {
                {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find File           ',
                    desc_hl = 'String',
                    key = 'b',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = 'lua print(2)'
                },
            },
        },
    },

    dependencies = { { 'nvim-tree/nvim-web-devicons' } }

}
