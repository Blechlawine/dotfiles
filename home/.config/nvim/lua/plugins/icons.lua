return {
    "nvim-tree/nvim-web-devicons",
    opts = {
        override = {
            dockerfile = {
                icon = "",
                color = "#328eef",
                name = "Dockerfile",
            },
            ["docker-compose.yml"] = {
                icon = "",
                color = "#328eef",
                name = "DockerCompose",
            },
            [".dockerignore"] = {
                icon = "",
                color = "#328eef",
                name = "DockerIgnore",
            },
        },
        override_by_extension = {
            ["vue"] = {
                icon = "﵂",
                color = "#33A06F",
                name = "Vue",
            },
            ["js"] = {
                icon = "",
                color = "#f1e05a",
                name = "Javascript",
            },
            ["mjs"] = {
                icon = "",
                color = "#f1e05a",
                name = "Javascript",
            },
            ["cjs"] = {
                icon = "",
                color = "#f1e05a",
                name = "Javascript",
            },
        },
    },
    config = function(_, opts)
        require("nvim-web-devicons").setup(opts)
    end,
}
