# parkerhemphill/hubitat-emporia-token-generator
## A simple docker image that grabs the latest EmporiaVue API tokens and uploads them to Hubitat once an hour
[![Docker Stars](https://img.shields.io/docker/stars/parkerhemphill/godaddy-dns-updater)](https://store.docker.com/community/images/parkerhemphill/hubitat-emporia-token-generator) 
[![Docker Pulls](https://img.shields.io/docker/pulls/parkerhemphill/godaddy-dns-updater)](https://store.docker.com/community/images/parkerhemphill/hubitat-emporia-token-generator)
### Flow of operations:
* 1: Container starts up and does a call to Emporia, grabbing the latest API key.  Script uploads API to Hubitat and sleeps for one hour before updating API key again
  
### Example usage:
```
#docker-compose.yaml
version: "3"
services:
  hubitat-emporia-token-generator:
    image: parkerhemphill/hubitat-emporia-token-generator
    container_name: hubitat-emporia-token-generator
    restart: unless-stopped
    environment:
      emporia_username='<Username for Emporia site>'
      emporia_password='<Password for Emporia>'
      emporia_device_id='<Device ID for Emporia driver in Hubitat>'
      hubitat_ip='<IP address of Hubitat>'
      maker_api_id='<App ID for maker app in Hubitat>'
      maker_api_token='<Token used by maker app in Hubitat>'
    volumes:
      - /tmp:/tmp
```
## Docker run example
```
docker run -d \
  --name=hubitat-emporia-token-generator \
  -e emporia_username='<Username for Emporia site>' \
  -e emporia_password='<Password for Emporia>' \
  -e emporia_device_id='<Device ID for Emporia driver in Hubitat>' \
  -e hubitat_ip='<IP address of Hubitat>' \
  -e maker_api_id='<App ID for maker app in Hubitat>' \
  -e maker_api_token='<Token used by maker app in Hubitat>'
  -v /tmp:/tmp \
  --restart unless-stopped \
  parkerhemphill/hubitat-emporia-token-generator:latest
```
## Support
* Shell access while the container is running:<br>
 `docker exec -it hubitat-emporia-token-generator /bin/bash`
* To see log of updates:<br>
 `docker exec -it hubitat-emporia-token-generator cat /tmp/emporia.log`
