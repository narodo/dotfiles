require("config.lazy")
require("config.keymaps")

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "config/plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("config.settings")
require("config.autocmds")
require("config.statusline")

require("scripts/telescope-buffer-picker")
