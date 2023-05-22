# Docker Server Configuration

This is a docker configuration for a server(s) with reverse proxy etc.

## Setting up your application server

Follow these steps:

- Edit [docker-compose.yml](/docker-compose.yml) and setup your application docker.
- Edit the nginx configuration as per your application [default.conf](nginx/conf.d/default.conf)
- Edit and use sample deploy script [deploy-script.sh](/deploy-script.sh)
