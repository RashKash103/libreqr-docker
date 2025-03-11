# libreqr - Docker

## Usage

### Server

```
ghcr.io/rashkash103/libreqr-docker
```

Server running on Apache.


#### Docker Run
```sh
docker run -d -p 8080:80 ghcr.io/rashkash103/libreqr-docker
```

#### Docker Compose
```yaml
services: 
  libreqr:
    image: ghcr.io/rashkash103/libreqr-docker
    ports:
      - 8080:80
```


## Credit

All credit goes to [miraty](https://code.antopie.org/miraty)'s [libreqr](https://code.antopie.org/miraty/libreqr/) repo.

## License

[AGPLv3+](https://www.gnu.org/licenses/agpl-3.0.en.html) as the original repo is.
