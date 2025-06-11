return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    dependencies = {
        'echasnovski/mini.icons',
    },
    config = function ()
        require("mini.icons").setup()
        require("markview").setup(
            {
                 preview = {
                    icon_provider = "mini",
                }
            }
        )
    end
};

