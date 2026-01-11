-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   lsp.lua                                            :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@student.1337.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/01/11 14:05:04 by abenkrar          #+#    #+#             --
--   Updated: 2026/01/11 14:10:27 by abenkrar         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

local lspconfig = require("lspconfig")

-- Set up clangd
lspconfig.clangd.setup({
  cmd = { "clangd" },
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf

    vim.keymap.set("n", "gd", function()
      local params = vim.lsp.util.make_position_params()

      vim.lsp.buf_request(bufnr, "textDocument/definition", params, function(_, result)
        if not result or vim.tbl_isempty(result) then
          return
        end

        -- Normalize result to a list
        local locations = vim.tbl_islist(result) and result or { result }

        -- First try to jump to non-header (.c/.cpp)
        for _, loc in ipairs(locations) do
          local uri = loc.uri or loc.targetUri
          if uri and not uri:match("%.h$") then
            vim.lsp.util.jump_to_location(loc)
            return
          end
        end

        -- Fallback: jump to first result
        vim.lsp.util.jump_to_location(locations[1])
      end)
    end, { buffer = bufnr, silent = true, desc = "Go to implementation (prefer source)" })
  end,
})
