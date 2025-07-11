-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.stdheader")
-- -- Disable LSP diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
