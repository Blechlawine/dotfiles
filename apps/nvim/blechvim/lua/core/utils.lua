local queue_which_key = function(mode, keybind, mapping_info)
    if Blechvim.which_key_queue[mode] == nil then
        Blechvim.which_key_queue[mode] = {}
    end
    Blechvim.which_key_queue[mode][keybind] = mapping_info[2]
end

return {
    load_mappings = function(mappings)
        vim.schedule(function()
            local function set_section_map(section_values)
                for mode, mode_mappings in pairs(section_values) do
                    for keybind, mapping_info in pairs(mode_mappings) do
                        if not mapping_info[1] or mapping_info.name then
                            -- its a which-key mapping, only queue it
                        else
                            vim.keymap.set(mode, keybind, mapping_info[1], mapping_info.opts)
                        end
                        queue_which_key(mode, keybind, mapping_info)
                    end
                end
            end

            for section_name, section in pairs(mappings) do
                set_section_map(section)
            end
            -- if package.loaded["which-key"] then
            --     require("core.utils").which_key_register()
            -- end
        end)
    end,

    which_key_register = function()
        if Blechvim.which_key_queue then
            local wk_avail, wk = pcall(require, "which-key")
            if wk_avail then
                for mode, registration in pairs(Blechvim.which_key_queue) do
                    wk.register(registration, { mode = mode })
                end
                Blechvim.which_key_queue = nil
            end
        end
    end,

    lazy_load_plugin = function(plugin)
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
            group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
            callback = function()
                local file = vim.fn.expand("%")
                local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

                if condition then
                    vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

                    -- don't defer treesitter as it will show slow highlighting
                    if plugin ~= "nvim-treesitter" then
                        vim.schedule(function()
                            require("lazy").load({ plugins = plugin })
                            if plugin == "nvim-lspconfig" then
                                vim.cmd("silent! do FileType")
                            end
                        end, 0)
                    else
                        require("lazy").load({ plugins = plugin })
                    end
                end
            end
        })
    end,

    echo = function(str)
        vim.cmd("redraw")
        vim.api.nvim_echo({ { str } }, true, {})
    end
}
