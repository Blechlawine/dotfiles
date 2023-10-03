#!/bin/bash
docker compose down
docker compose up --build -d
docker compose exec -it dotfiles /bin/bash