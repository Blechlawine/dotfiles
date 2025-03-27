local util = vim.lsp.util

local ___ = '\n─────────────────────────────────────────────────────────────────────────────\n'

-- From https://github.com/SichangHe/.config/blob/e7baf000ac6042d0a3ddf767b68f0b71e6d14d3d/nvim/lua/hovering.lua
local LSPWithDiagSource = {
    name = 'LSP',
    priority = 1000,
    enabled = function()
        return true
    end,
    execute = function(_, done)
        local params = util.make_position_params(0, 'utf-8')
        vim.lsp.buf_request_all(0, 'textDocument/hover', params, function(responses)
            local value = ''
            for clientId, response in pairs(responses) do
                local result = response.result
                local client = vim.lsp.get_client_by_id(clientId)
                if result and result.contents and result.contents.value and client ~= nil then
                    if value ~= '' then
                        value = value .. ___
                    end
                    value = value .. client.name .. ':\n' .. result.contents.value
                end
            end

            local _, row = unpack(vim.fn.getpos('.'))
            local lineDiag = vim.diagnostic.get(0, { lnum = row - 1 })
            for _, d in pairs(lineDiag) do
                if d.message then
                    if value ~= '' then
                        value = value .. ___
                    end
                    -- TODO: add LSP name to value
                    value = value .. string.format('*%s* %s', d.source, d.message)
                end
            end
            value = value:gsub('\r', '')

            if value ~= '' then
                done({ lines = vim.split(value, '\n'), filetype = 'markdown' })
            else
                done()
            end
        end)
    end,
}

--- @type LazySpec
return {
    "lewis6991/hover.nvim",
    event = "BufRead",
    opts = {
        init = function()
            -- Require providers
            -- require("hover.providers.lsp") -- is replaced with custom provider: LSPWithDiagSource
            require("hover").register(LSPWithDiagSource)
            require('hover.providers.man')
        end,
    },
    config = function(_, opts)
        require("hover").setup(opts)
        vim.keymap.set("n", "K", function()
            local hover_win = vim.b.hover_preview
            if hover_win and vim.api.nvim_win_is_valid(hover_win) then
                vim.api.nvim_set_current_win(hover_win)
            else
                require("hover").hover()
            end
        end, { desc = "hover.nvim" })
    end,
}
