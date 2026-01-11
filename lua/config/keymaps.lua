-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   keymaps.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@student.1337.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/01/11 13:59:24 by abenkrar          #+#    #+#             --
--   Updated: 2026/01/11 14:02:32 by abenkrar         ###   ########.fr       --
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
