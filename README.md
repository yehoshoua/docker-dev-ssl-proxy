A simple nginx proxy behind a self-generated & self-signed SSL certificate.

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

Also, note the included docker-compose.yml file if you wish to use Docker Compose.
