#!/usr/bin/env bash

script_dir="$(dirname ${BASH_SOURCE})"
app_name=$1
app_version=$2
command_name=$3

function all_commands {
  echo -e "$(cat <<EOF
${app_name} is a tool for ...

\e[1mVERSION\e[0m
  ${app_name}/${app_version}

\e[1mUSAGE\e[0m
  $ ${app_name} [COMMAND]

\e[1mCOMMANDS\e[0m
  help     Display help for example
  apps     Manage apps
  version  Display version
EOF
)\n" >&2
}

case $command_name in

  ""|help|version)
    all_commands
    exit 0
  ;;

  apps*)
    ${script_dir}/apps/main.sh "${app_name}" "${app_version}" $command_name --help
    exit 0
  ;;

  start)
    ${script_dir}/apps/main.sh "${app_name}" "${app_version}" apps:start --help
    exit 0
  ;;

  stop)
    ${script_dir}/apps/main.sh "${app_name}" "${app_version}" apps:stop --help
    exit 0
  ;;

  *)
    echo -e "\033[32mError: Invalid command '${command_name}'\033[m\n" >&2
    all_commands
    exit 1
  ;;
esac
