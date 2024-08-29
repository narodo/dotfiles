require("config.lazy")
require("config.keymaps")
require("config.settings")

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "config/plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("config.autocmds")
require("config.statusline")
require("config.color")

require("scripts/telescope-buffer-picker")
