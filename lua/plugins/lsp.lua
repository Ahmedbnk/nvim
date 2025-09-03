return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- on_attach function to map keys after LSP attaches to buffer
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        -- LSP keymaps
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
        nmap("<leader>ws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")
      end

      -- Capabilities setup (optional)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-16" }

      -- Path to Mason-installed clangd
      local clangd_path = "/home/abenkrar/.local/share/nvim/mason/bin/clangd"

      lspconfig.clangd.setup({
        cmd = {
          clangd_path,
          "--compile-commands-dir=" .. vim.fn.getcwd(),
          "--clang-tidy",
          "--header-insertion=never",
          "-I/usr/include",
          "-I/usr/local/include",
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
