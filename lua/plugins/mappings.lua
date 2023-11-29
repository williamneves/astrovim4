-- if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings set up as well as which-key menu titles
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      -- first key is the mode
      n = {
        -- resize windows with ctrl shift arrows
        ["<C-S-Up>"] = { ":resize +2<CR>", desc = "Resize window up" },
        ["<C-S-Down>"] = { ":resize -2<CR>", desc = "Resize window down" },
        ["<C-S-Left>"] = { ":vertical resize +2<CR>", desc = "Resize window left" },
        ["<C-S-Right>"] = { ":vertical resize -2<CR>", desc = "Resize window right" },

        -- With Alt (M) + Shift up or down, copy (wihout register) the line up or down
        ["<M-S-Up>"] = { ":t .-0<CR>", desc = "Copy line up" },
        ["<M-S-Down>"] = { ":t .+0<CR>", desc = "Copy line down" },

        -- With Alt (m) + "d"
        -- Personal Keysmaping
        ["d"] = { '"_d', desc = "Delete without copy" },
        [">"] = { ">gv", desc = "Indent" },
        ["<"] = { "<gv", desc = "Unindent" },
        ["<M-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
        ["<M-k>"] = { ":m .-2<CR>==", desc = "Move line up" },

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { desc = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
      },
      v = {
        [">"] = { ">gv", desc = "Indent" },
        ["<"] = { "<gv", desc = "Unindent" },
        ["d"] = { '"_d', desc = "Delete without copy" },
        ["<M-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
        ["<M-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
      },
      i = {
        ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
        ["<M-j>"] = { "<ESC>:m .+1<CR>==", desc = "Move line down" },
        ["<M-k>"] = { "<ESC>:m .-2<CR>==", desc = "Move line up" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
