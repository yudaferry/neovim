return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.code_actions.eslint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<space>gf", function()
      vim.lsp.buf.format({ async = false })
    end, { desc = "format code" })
  end,
}
