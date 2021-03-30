A simple nginx proxy behind a self-generated & self-signed SSL certificate, with included support for WebSocket proxying.

For production usage, you may want to consider using LetsEncrypt w/ Docker https://github.com/linuxserver/docker-letsencrypt.

Note, for those who would rather build this sort of thing from scratch, here's an article written by the author of the original package we forked from:  https://devblogs.microsoft.com/cse/2018/01/29/orchestrating-turn-servers-cloud-deployment

# Building

Note: Building this package creates a new SSL certificate automatically.

```
docker build -t docker-dev-ssl-proxy .
```

# Running

Be sure to change PROXY_ADDRESS to wherever you are proxying to.

```
docker run --net=host -e PROXY_ADDRESS="http://localhost:8080" docker-dev-ssl-proxy
```

Then navigate to https://localhost in your browser.

Note that WebSocket proxying is set to the /socket.io path. At this time, you'll need to update virtual-site.template manually if you wish to change this path.

Also, note the included docker-compose.yml file if you wish to use Docker Compose.
