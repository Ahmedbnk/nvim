-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   keymaps.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@student.1337.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/01/11 13:59:24 by abenkrar          #+#    #+#             --
--   Updated: 2026/04/19 16:46:31 by abenkrar         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap(
  "n",
  "<C-LeftMouse>",
  "<Cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
-- Navigate between splits while in terminal mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
