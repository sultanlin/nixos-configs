-- import nvim-treesitter plugin
local treesitter = require("nvim-treesitter.configs")

-- configure treesitter
treesitter.setup({ -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    -- "css",
    -- "html",
    -- "json",
    -- "javascript",
    -- "typescript",
    -- "tsx",
    -- "yaml",
    -- "prisma",
    -- "markdown",
    -- "markdown_inline",
    -- "svelte",
    -- -- "graphql",
    -- "bash",
    -- "lua",
    -- "vim",
    -- "dockerfile",
    -- "gitignore",
    -- "query",
    -- "c",
    -- "cpp",
    -- "go",
    -- "java",
    -- "nix",
    -- "python",
    -- "rust",
    -- "scala",
    -- "sql",
    -- "terraform",
    -- "c_sharp",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
