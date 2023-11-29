return {
  -- Add community imports to the `lua/config/lazy.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.pack.json" },

  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.completion.copilot-lua" },
  -- This is a good place to do further customize the options set by the community plugins/packs
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     integrations = {
  --       sandwich = false,
  --       noice = true,
  --       mini = true,
  --       leap = true,
  --       markdown = true,
  --       neotest = true,
  --       cmp = true,
  --       overseer = true,
  --       lsp_trouble = true,
  --       rainbow_delimiters = true,
  --     },
  --   },
  -- },
}
