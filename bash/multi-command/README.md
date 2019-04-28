# multi-command

## Usage
```console
$ bash example
example is a tool for ...

VERSION
  example/0.0.1

USAGE
  $ example [COMMAND]

COMMANDS
  help     Display help for example
  apps     Manage apps
  version  Display version
```

```console
$ bash example help apps
Manages apps

USAGE
  $ example apps

COMMANDS
  start  Run a new HTTP server
  stop   Shut down a HTTP server
```

```console
$ bash example help apps:start
Runs a new HTTP server

USAGE
  $ example start

OPTIONS
  --host  Host name of HTTP server. (default: localhost)
  --port  Port number. (default: 8080)

EXAMPLES
  $ example apps:start
  ...

  $ example start
  ...

  # specify host and port
  $ example apps:start --host foo.example.com --port 80
  ...
```

```console
$ bash example version
example version 0.0.1
```

```console
$ bash example apps:start
server started. host is localhost, port is 8080.
```

```console
$ bash example apps:start --host foo.bar.baz --port 80
server started. host is foo.bar.baz, port is 80.
```

```console
$ EXAMPLE_HOST=foo.bar.baz EXAMPLE_PORT=80 bash example apps:start
server started. host is foo.bar.baz, port is 80.
```

## Links
- [Shell Style Guide - Google Style Guides | styleguide](https://google.github.io/styleguide/shell.xml)
- [12 Factor CLI Apps – Jeff Dickey – Medium](https://medium.com/@jdxcode/12-factor-cli-apps-dd3c227a0e46)
