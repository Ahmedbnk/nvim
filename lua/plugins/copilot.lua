-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   copilot.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@student.1337.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2025/07/11 14:52:04 by abenkrar          #+#    #+#             --
--   Updated: 2025/07/11 14:52:46 by abenkrar         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

-- copilot.nvim configuration
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
