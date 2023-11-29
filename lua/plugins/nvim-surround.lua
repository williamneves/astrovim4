return {
  "kylechui/nvim-surround",
  disable = false,
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    local get_expanded_surrounds = function(input)
      -- expand with emmet, use 1 as last param to keep the "${cursor}" strings
      local expansion = vim.fn["emmet#expandWord"](input, "html", 1)
      -- use last "${cursor}" position to place the content to be wrapped, there can be multiple "${cursor}" strings
      local open_end_pos, close_start_pos = string.match(expansion, ".*()${cursor}()")

      -- remove all extra "${cursor}" strings
      local open_text = string.gsub(string.sub(expansion, 1, open_end_pos - 1), "${cursor}", "")
      local close_text = vim.fn.trim(string.sub(expansion, close_start_pos))

      -- split by newline
      local open = vim.split(open_text, "\n")
      local close = vim.split(close_text, "\n")

      return open, close
    end

    require("nvim-surround").setup {
      surrounds = {
        ["S"] = {
          add = function() return { { "[(" }, { ")]" } } end,
          find = function() end,
          delete = function() end,
          change = {},
        },
        ["t"] = {
          add = function()
            local input = require("nvim-surround.config").get_input "Enter the HTML tag: "
            if input then
              local open, close = get_expanded_surrounds(input)
              return { open, close }
            end
          end,
          find = function() return require("nvim-surround.config").get_selection { motion = "at" } end,
          delete = "^(%b<>)().-(%b<>)()$",
          change = {
            target = "^<([^%s<>]*)().-([^/]*)()>$",
            replacement = function()
              local input = require("nvim-surround.config").get_input "Enter the HTML tag: "
              if input then
                local element = input:match "^<?([^%s>]*)"
                local attributes = input:match "^<?[^%s>]*%s+(.-)>?$"
                local open = attributes and element .. " " .. attributes or element
                local close = element
                return { { open }, { close } }
              end
            end,
          },
        },
        ["T"] = {
          add = function()
            local input = require("nvim-surround.config").get_input "Enter the HTML tag: "
            if input then
              local open, close = get_expanded_surrounds(input)
              return { open, close }
            end
          end,
          find = function() return require("nvim-surround.config").get_selection { motion = "at" } end,
          delete = "^(%b<>)().-(%b<>)()$",
          change = {
            target = "^(%b<>)().-(%b<>)()$",
            replacement = function()
              local input = require("nvim-surround.config").get_input "Enter the HTML tag: "
              if input then
                local open, close = get_expanded_surrounds(input)
                return { open, close }
              end
            end,
          },
        },
      },
    }
  end,
  requires = { "mattn/emmet-vim" },
}
