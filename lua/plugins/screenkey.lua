return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- or branch = "dev", to use the latest commit
  config = function()
    -- vim.g.screenkey_statusline_component = true
    --
    -- vim.keymap.set("n", "<leader>ssc", function()
    --   vim.g.screenkey_statusline_component = not vim.g.screenkey_statusline_component
    -- end, { desc = "Toggle screenkey statusline component" })
    --
    -- require("lualine").setup({
    --   -- other options ...
    --   sections = {
    --     -- other sections ...
    --     lualine_c = {
    --       -- other components ...
    --       function()
    --         return require("screenkey").get_keys()
    --       end,
    --     },
    --   },
    -- })
    --
    -- require("screenkey").redraw()

    local screenkey = require("screenkey")
    local notify = require("notify")
    local toggleScreenKey = function()
      vim.cmd("Screenkey toggle")
      -- change notification position
      notify.setup({
        top_down = screenkey.is_active(),
      })
    end

    vim.keymap.set("n", "<leader>tsk", toggleScreenKey, { desc = "[T]oggle [S]creen[K]ey" })
  end,
}
