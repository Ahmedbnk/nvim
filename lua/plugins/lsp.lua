-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   lsp.lua                                            :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: abenkrar <abenkrar@student.1337.ma>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2026/01/11 14:16:44 by abenkrar          #+#    #+#             --
--   Updated: 2026/01/11 14:17:04 by abenkrar         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

vim.keymap.set("n", "gd", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
    if not result or vim.tbl_isempty(result) then
      return
    end

    local locations = vim.tbl_islist(result) and result or { result }

    -- Jump to first non-header file if possible
    for _, loc in ipairs(locations) do
      local uri = loc.uri or loc.targetUri
      if uri and not uri:match("%.h$") then
        vim.lsp.util.jump_to_location(loc)
        return
      end
    end

    -- fallback: jump to first result
    vim.lsp.util.jump_to_location(locations[1])
  end)
end, { buffer = bufnr, desc = "Go to implementation (prefer source)" })
