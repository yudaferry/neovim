return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
      sections = { lualine_c = { "lsp_progress" }, lualine_x = { "tabnine" } },
    })
  end,
}
