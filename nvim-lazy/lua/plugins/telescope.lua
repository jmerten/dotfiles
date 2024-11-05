return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^.git/",   -- ignore .git directories
        "^vendor/", -- ignore vendor folders
        "^target/", -- ignore rust target directory
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
      live_grep = {
        glob_pattern = {
          "!^.git/*",
          "!^vendor/*",
          "!^target/*",
        },
        additional_args = {
          "--hidden",
          "--no-ignore",
        },
      }
    }
  }
}
