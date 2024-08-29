-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
vim.opt.relativenumber = false
vim.opt.number = true
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
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-j>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
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
      require("treesj").setup {--[[ your config ]]
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
