local neotree = require("neo-tree")
neotree.setup {
  window = {
    width = 32,
  },
  popup_border_style = "rounded",
  enable_git_status = true,
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        "node_modules",
        ".git",
      },
    }
  }
}