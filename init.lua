require("config.options")
require("config.lazy")

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})

-- Set colorscheme
vim.cmd("colorscheme retrobox")

-- Auto-save on leaving Insert mode, switching buffers, or losing focus
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "silent! write",
})

-- Make background transparent in Normal and related UI elements
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- ==========================
-- Smart Jump to Definition
-- ==========================
local function smart_jump_to_definition()
  local has_lsp = false
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.server_capabilities.definitionProvider then
      has_lsp = true
      vim.lsp.buf.definition()
      return
    end
  end

  if not has_lsp then
    if vim.fn.filereadable("tags") == 1 or vim.fn.filereadable("TAGS") == 1 then
      vim.cmd("tag " .. vim.fn.expand("<cword>"))
      return
    end

    local word = vim.fn.expand("<cword>")
    if word and word ~= "" then
      local grep_cmd = "silent grep! -r 'function.*"
        .. word
        .. "\\|"
        .. word
        .. "\\s*=\\s*function\\|class.*"
        .. word
        .. "' ."
      vim.cmd(grep_cmd)
      vim.cmd("copen")
      vim.notify("LSP not available. Using grep to find '" .. word .. "'", vim.log.levels.INFO)
      return
    end
  end

  vim.notify("No definition found. Try generating tags with 'ctags -R .'", vim.log.levels.WARN)
end

-- Key mappings for Smart Jump
vim.keymap.set("n", "<F12>", smart_jump_to_definition, { desc = "Smart go to definition (F12)" })
vim.keymap.set("n", "<M-g>", smart_jump_to_definition, { desc = "Smart go to definition (Alt+G)" })
vim.keymap.set("n", "gd", smart_jump_to_definition, { desc = "Smart go to definition (gd)" })

-- Optional: Command to generate tags manually
vim.api.nvim_create_user_command("GenerateTags", function()
  if vim.fn.executable("ctags") == 1 then
    vim.cmd("!ctags -R .")
    vim.notify("Tags generated successfully", vim.log.levels.INFO)
  else
    vim.notify("ctags not found. Please install it for better code navigation", vim.log.levels.ERROR)
  end
end, { desc = "Generate tags file for code navigation" })
