-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
vim.g.material_style = "deep ocean"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.mellow-nvim" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  "pantharshit00/vim-prisma",
  -- plugin for markdown preview
  -- :MarkdownPreview to preview the markdown file
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup {
        position = "right",
        window = {
          position = "right",
          width = 30,
        },
      }
    end,
  },
  -- OverSeer to run project commands
  {
    "stevearc/overseer.nvim",
    opts = {},
  },
  -- turbo console
  {
    "gaelph/logsitter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("logsitter").setup {
        path_format = "default",
        separator = "=>",
        prefix = "[log]:",
        logging_functions = {
          "log",
          "debug",
          "info",
          "warn",
          "error",
          "fatal",
          "trace",
        },
        mappings = {
          toggle = "<C-l>",
        },
      }
      vim.keymap.set("i", "<C-l>", function() require("logsitter").log() end, { silent = true })
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-h>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
    end,
  },
  { "marko-cerovac/material.nvim" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use main branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup { --[[ your config ]]
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  -- import/override with your plugins folder
}
