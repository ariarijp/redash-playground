# redash-playground

## Requirements

- Docker 17.12.0-ce or higher
- Docker Compose 1.18.0 or higher

## Usage

```shell
$ cd redash-playground
$ ./setup.sh
$ open http://localhost:5000 # Set up Admin account on your browser
$ docker-compose exec server /tmp/setup-ds.sh
```

## Sample Datasources

### MySQL

- world database
- world_x database
- sakila database
- menagerie database

## License

MIT

## Author

[ariarijp](https://github.com/ariarijp)
