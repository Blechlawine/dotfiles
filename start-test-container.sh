#!/bin/bash
docker compose up --build -d
docker compose exec -it dotfiles /bin/bash