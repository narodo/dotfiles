return {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)

    dependencies = {
        "rafamadriz/friendly-snippets",
        'saadparwaiz1/cmp_luasnip'
    },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
