return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to declaration" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
          end,
        },
      },
    },
  },
}
