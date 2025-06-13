return {
    'renerocksai/telekasten.nvim',

    dependencies = {
        'nvim-telescope/telescope.nvim',
        'mattn/calendar-vim',
    },

    config = function()
        require('telekasten').setup({
            home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
            take_over_my_home = false,
            auto_set_filetype = false,
            dailies = vim.fn.expand("~/zettelkasten/dailies"),
            templates = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates"),
            template_new_daily = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/daily.md"),
            template_new_note = vim.fn.expand("~/tools/dotfiles/zettelkasten/templates/newNote.md"),
        })

    end
}
