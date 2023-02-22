local config = {
    opt = {
        shiftwidth = 4,
        softtabstop = 4,
        smartindent = true,
        hlsearch = true,
        incsearch = true,
        relativenumber = true,
    },
    g = {
        cmp_enabled = true,
        autopairs_enabled = true,
        icons_enabled = true,
    }
}

for k,c in pairs(config) do
    for l,v in pairs(c) do
        vim[k][l] = v
    end
end
