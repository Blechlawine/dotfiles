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
            ["robots.txt"] = {
                icon = "󰚩",
                color = "#f1e05a",
                name = "Robots",
            },
            ["schema.prisma"] = {
                icon = "",
                name = "PrismaSchema",
            },
        },
        override_by_extension = {
            ["vue"] = {
                icon = "󰡄",
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
            ["svg"] = {
                icon = "󰜡",
                name = "svg",
            },
            ["toml"] = {
                icon = "",
                name = "toml",
            },
            ["astro"] = {
                -- icon = "", -- If this:  shows the astro rocket, use it, otherwise a fallback rocket (this icon doesn't work with comic code)
                icon = "",
                name = "Astro",
            }
        },
    },
    config = function(_, opts)
        require("nvim-web-devicons").setup(opts)
    end,
}
