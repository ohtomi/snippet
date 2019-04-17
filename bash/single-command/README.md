# single-command

## Usage
```console
$ bash example --help
example is a tool for ...

VERSION
  example/0.0.1

USAGE
  $ example

OPTIONS
  --host  Host name of HTTP server. (default: localhost)
  --port  Port number. (default: 8080)

EXAMPLES
  $ example
  ...

  # specify host and port
  $ example --host foo.example.com --port 80
  ...
```

```console
$ bash example --version
example version 0.0.1
```

```console
$ bash example
ost is localhost, port is 8080.
```

```console
$ bash example --host foo.bar.baz --port 80
host is foo.bar.baz, port is 80.
```

```console
$ EXAMPLE_HOST=foo.bar.baz EXAMPLE_PORT=80 bash example
host is foo.bar.baz, port is 80.
```
