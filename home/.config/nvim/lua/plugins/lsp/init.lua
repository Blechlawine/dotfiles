vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP mappings",
    callback = function(event)
        local options = { buffer = event.buf, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
        vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol("") end, options)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, options)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, options)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, options)
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, options)
        vim.keymap.set("n", "<leader>lu", function() vim.lsp.buf.references() end, options)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, options)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, options)
    end,
})
