return {
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
                        end)
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
    end,

    read_json_file = function(filename)
        local Path = require("plenary.path")

        local path = Path:new(filename)
        if not path:exists() then
            return nil
        end

        local json_contents = path:read()
        local json = vim.fn.json_decode(json_contents)

        return json
    end,

    read_package_json = function()
        local utils = require("core.utils")
        return utils.read_json_file("package.json")
    end,

    ---Check if the given NPM package is installed in the current project.
    ---@param package string
    ---@return boolean
    is_npm_package_installed = function(package)
        local utils = require("core.utils")
        local package_json = utils.read_package_json()
        if not package_json then
            return false
        end

        if package_json.dependencies and package_json.dependencies[package] then
            return true
        end

        if package_json.devDependencies and package_json.devDependencies[package] then
            return true
        end

        return false
    end,


    -- fallback to global typescript installation when local one is not found
    get_typescript_server_path = function(root_dir)
        local util = require("lspconfig.util")
        local global_ts = "/home/marc/.bun/install/global/node_modules/typescript/lib"
        -- Alternative location if installed as root:
        -- local global_ts = "/usr/local/lib/node_modules/typescript/lib"
        local found_ts = ""
        local function check_dir(path)
            found_ts = util.path.join(path, "node_modules", "typescript", "lib")
            if util.path.exists(found_ts) then
                return path
            end
        end
        if util.search_ancestors(root_dir, check_dir) then
            return found_ts
        else
            return global_ts
        end
    end,
}
