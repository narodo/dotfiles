return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = { [[<leader>h]] },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
            global_settings = {
                save_on_toggle = true,
                enter_on_sendcmd = true,
            },
        }
}
