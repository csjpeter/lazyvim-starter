return {
  -- replaces the UI for messages, cmdline and the popupmenu
  { "folke/noice.nvim", enabled = true },
  -- some kind of error list handler in prettier look/format
  { "folke/trouble.nvim", enabled = true },
  -- colorscheme with treesitter support
  { "folke/tokyonight.nvim", enabled = true },
  -- nice highlight for special comments: FIXME, TODO, etc
  { "folke/todo-comments.nvim", enabled = false },
  -- session manager
  { "folke/persistence.nvim", enabled = false },
  -- Alternate hlsearch
  { "folke/flash.nvim", enabled = false },
  -- Some comment skeleton collection
  { "folke/ts-comments.nvim", enabled = false },
  -- vertical lines for each indent depth
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- coding assistant with linter. lsp, dap, etc
  { "williamboman/mason.nvim", enabled = true, lazy = false },
  -- Code style, linter suggestions
  { "neovim/nvim-lspconfig", enabled = true },
  -- Copilot
  { "zbirenbaum/copilot", enabled = true },
  -- yetone/avante.nvim AI plugin mimicing Cursor IDE
  -- { "yetone/avante.nvim", enabled = true },
  -- image pasting for avante AI
  { "HakonHarnes/img-clip.nvim", enabled = true },
  -- avante AI needs this
  { "MeanderingProgrammer/render-markdown.nvim", enabled = true },
  -- Error messages into dialog in the top right corner
  { "rcarriga/nvim-notify", enabled = true },
  --
  { "mfussenegger/nvim-lint", enabled = false },
  -- "" {} () all the annoying pretyping
  { "echasnovski/mini.pairs", enabled = false },
  -- avante AI needs it
  { "echasnovski/mini.ai", enabled = true },
  -- avante AI needs it
  { "echasnovski/mini.icons", enabled = true },
  -- Styling tabline
  { "akinsho/bufferline.nvim", enabled = false },
  -- color schema
  { "catppuccin/nvim", enabled = false },
  -- Creates dictionary of current buffer for autocompletion of words
  { "hrsh7th/cmp-buffer", enabled = false },
  -- Some lsp based autocomplation
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  -- One another for autocompletion about file paths
  { "hrsh7th/cmp-path", enabled = false },
  -- This wants to be more wise than some lsp stuff about realtime code reformatting
  { "stevearc/conform.nvim", enabled = false },
  -- Initial view with initial list of shortcut keys
  { "nvimdev/dashboard-nvim", enabled = false },
  -- Some kind of dialogs instead of classing vim command line (neded by avante AI)
  { "stevearc/dressing.nvim", enabled = true },
  -- Support for autocompletion with code skeletons
  { "rafamadriz/friendly-snippets", enabled = false },
  -- Marks, signs changed lines since last git commit
  { "lewis6991/gitsigns.nvim", enabled = true },
  -- Find and Replace alternative
  { "MagicDuck/grug-far.nvim", enabled = false },
  -- Bottom status line for each window (how to add current function?)
  { "nvim-lualine/lualine.nvim", enabled = true },
  -- Some nodejs stuff
  { "Bilal2453/luvit-meta", enabled = false },
  -- Some dialog window showing UI tool, needed by noice, by notify and telescope.
  -- It collects error logs vim and I can investigate them later on.
  { "MunifTanjim/nui.nvim", enabled = true },
  -- One another autocompletion, looks being a basic stuff
  { "hrsh7th/nvim-cmp", enabled = true },
  -- some code template/skeleton based autocomplation
  { "garymjr/nvim-snippets", enabled = false },
  -- autocompleting html tags
  { "windwp/nvim-ts-autotag", enabled = false },
  -- Some kind of lua function collection, library
  { "nvim-lua/plenary.nvim", enabled = true },
  -- Super loved search/find algorithm instead of grep
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  -- Builds and provides AST of the source under edit (needed by avante AI)
  { "nvim-treesitter/nvim-treesitter", enabled = true,
    opts = {
      highlight = { enable = false, },
      --incremental_selection = { enable = true },
      --textobjects = { enable = true },
    },
  },
  --
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
  -- Use below command to see highlight group of word under cursor
  -- :TSHighlightCapturesUnderCursor
  { "nvim-treesitter/playground", enabled = false },
  -- left sidebar with filesystem tree navigation
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- To be able to configure, what linters should be installed
  { "williamboman/mason-lspconfig.nvim", enabled = true,
    ensure_installed = {
      "ansible-lint",
      -- "clang-format",
      -- "clangd",
      -- "cmakelang",
      -- "cmakelint",
      "flake8",
      "yamllint",
    },
  },
  -- git UI
  { "jesseduffield/lazygit", enabled = true },
}
