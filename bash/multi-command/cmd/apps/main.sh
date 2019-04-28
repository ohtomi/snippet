#!/usr/bin/env bash

script_dir="$(dirname ${BASH_SOURCE})"
app_name=$1
shift
app_version=$1
shift

function usage {
  echo -e "$(cat <<EOF
Manages apps

\e[1mUSAGE\e[0m
  $ ${app_name} apps

\e[1mCOMMANDS\e[0m
  start  Run a new HTTP server
  stop   Shut down a HTTP server
EOF
)\n" >&2
}

function main {
  if [[ $# -eq 0 ]]; then
    usage
    exit 1
  fi

  command_name=$1
  shift
  case $command_name in

    apps)
      usage
      exit 0
    ;;

    apps:start)
      ${script_dir}/start.sh "${app_name}" "${app_version}" "$@"
      exit 0
    ;;

    apps:stop)
      ${script_dir}/stop.sh "${app_name}" "${app_version}" "$@"
      exit 0
    ;;

    *)
      echo -e "\033[32mError: Invalid command '${command_name}'\033[m\n" >&2
      usage
      exit 1
    ;;
  esac
}

main "$@"
