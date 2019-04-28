#!/usr/bin/env bash

app_name=$1
shift
app_version=$1
shift

function usage {
  echo -e "$(cat <<EOF
Runs a new HTTP server

\e[1mUSAGE\e[0m
  $ ${app_name} start

\e[1mOPTIONS\e[0m
  --host  Host name of HTTP server. (default: localhost)
  --port  Port number. (default: 8080)

\e[1mEXAMPLES\e[0m
  $ ${app_name} apps:start
  ...

  $ ${app_name} start
  ...

  # specify host and port
  $ ${app_name} apps:start --host foo.example.com --port 80
  ...
EOF
)\n" >&2
}

host="${EXAMPLE_HOST:-localhost}"
port=${EXAMPLE_PORT:-8080}

function parse_options {
  while [[ $# -gt 0 ]]; do
    case $1 in

      --host)
        host=$2
        shift
      ;;

      --port)
        port=$2
        shift
      ;;

      --trace)
        set -xue
      ;;

      --debug|-d)
        trap 'read -p "(${BASH_SOURCE}:${LINENO}) $BASH_COMMAND"' DEBUG
      ;;

      help|--help|-h)
        usage
        exit 1
      ;;

      *)
        echo -e "\033[32mError: Invalid option '${1}'\033[m\n" >&2
        usage
        exit 1
      ;;
    esac
    shift
  done
}

function main {
  parse_options $@
  ret=$?
  if [[ $ret -ne 0 ]]; then
    exit $ret
  fi

  echo -e "\033[4;36mserver started. host is ${host}, port is ${port}.\033[m\n"
}

main "$@"
