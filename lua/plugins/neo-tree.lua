return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          -- ["l"] = "focus_preview",
          ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
          ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
        },
      },
    })
    require("neo-tree.command").execute({
      action = "close",
      toggle = true,
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
  end,
}
