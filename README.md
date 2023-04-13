# cf-docker-nginx-microservice

Base nginx box for internal web services

## Usage with Docker

### Build

- `docker build -t cf-docker-nginx-microservice .`

### Run

- `docker run -d -p 80:80 cf-docker-nginx-microservice`
- (or: Use build container in a service's `docker-compose.yaml`)

```yaml
  nginx:
    image: cf-docker-nginx-microservice:latest
```