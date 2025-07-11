-- Load the Vimscript header functionality
vim.cmd("source ~/.config/nvim/lua/plugins/stdheader.vim")

-- Add autocmd to insert header if not already there
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = {
    "*.c",
    -- "*.h",
    -- "*.cpp",
    -- "*.hpp",
    -- "*.py",
    -- "*.java",
    -- "*.rs",
    -- "*.go",
    -- "*.ts",
    -- "*.js",
    -- "*.lua",
  },
  callback = function()
    if vim.fn.search(":::      ::::::::", "nw") == 0 then
      vim.cmd("Stdheader")
    end
  end,
})
