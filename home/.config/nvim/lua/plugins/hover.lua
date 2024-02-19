local util = vim.lsp.util

local ___ = '\n─────────────────────────────────────────────────────────────────────────────\n'

-- From https://github.com/SichangHe/.config/blob/e7baf000ac6042d0a3ddf767b68f0b71e6d14d3d/nvim/lua/hovering.lua
local LSPWithDiagSource = {
    name = 'LSP',
    priority = 1000,
    enabled = function()
        return true
    end,
    execute = function(opts, done)
        local params = util.make_position_params()
        vim.lsp.buf_request_all(0, 'textDocument/hover', params, function(responses)
            local value = ''
            for clientId, response in pairs(responses) do
                local result = response.result
                local client = vim.lsp.get_client_by_id(clientId)
                if result and result.contents and result.contents.value then
                    if value ~= '' then
                        value = client.name .. ':\n' .. value .. ___
                    end
                    value = client.name .. ':\n' .. value .. result.contents.value
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

return {
    "lewis6991/hover.nvim",
    event = "BufRead",
    config = function()
        require("hover").setup({
            init = function()
                -- Require providers
                -- require("hover.providers.lsp") -- is replaced with custom provider: LSPWithDiagSource
                require("hover").register(LSPWithDiagSource)
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                require('hover.providers.man')
                require('hover.providers.dictionary')
            end,
        })
        vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
    end,
}
