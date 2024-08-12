# media-server

Test buildarr config:

docker run --rm   -v "path/to/buildarr.yml:/config/buildarr.yml:ro"   --env-file .env.local   -e PUID=1000 -e PGID=1000   callum027/buildarr:latest test-config