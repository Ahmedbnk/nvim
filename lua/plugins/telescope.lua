-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   telescope.lua                                      :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@1337.student.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/04/16 13:31:52 by abenkrar          #+#    #+#             --
--   Updated: 2026/04/16 13:31:52 by abenkrar         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "LSP Document Symbols",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
