
local M = {}

function M.setup()
  --vim.g.nvim_tree_show_icons = {
      --git = 0,
      --folders = 1,
      --files = 0,
      --folder_arrows = 1,
  --}
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
    sync_root_with_cwd = false,
    update_focused_file = {
      enable = false,
      update_cwd = false,
    },
    git = {
      enable = false,
      ignore = true,
      show_on_dirs = true,
      timeout = 400,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_width = 2,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "├",
          bottom = "│",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = false,
          folder = true,
          folder_arrow = true,
          git = false,
        },

         glyphs = {
            default = "",
            symlink = "➛",
            bookmark = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "E",
              empty_open = "E",
              symlink = "➛",
              symlink_open = "➛",
            },


          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
      },

  }

  --vim.g.nvim_tree_respect_buf_cwd = 0
end

return M
