return {
  -- {
  --   "tpope/vim-fugitive",
  -- },
  {
    "sindrets/diffview.nvim",
  },
  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          print("selected commit:", commit.hash)
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        end,
        on_select_range_commit = function(from, to)
          print("selected range:", from.hash, to.hash)
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
}
