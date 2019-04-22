#!/usr/bin/env bash

#
# text attributes
#
function text_reset {
  echo -ne "\e[m"
}

function text_normal {
  echo -ne "\e[0m"
}

function text_bold {
  echo -ne "\e[1m"
}

function text_underscore {
  echo -ne "\e[4m"
}

function text_blink {
  echo -ne "\e[5m"
}

function text_inverse {
  echo -ne "\e[7m"
}

function text_underscore_off {
  echo -ne "\e[24m"
}

function text_blink_off {
  echo -ne "\e[25m"
}

function text_inverse_off {
  echo -ne "\e[27m"
}


#
# foreground colors
#
function foreground_black {
  echo -ne "\e[30m"
}

function foreground_red {
  echo -ne "\e[31m"
}

function foreground_green {
  echo -ne "\e[32m"
}

function foreground_yellow {
  echo -ne "\e[33m"
}

function foreground_blue {
  echo -ne "\e[34m"
}

function foreground_magenta {
  echo -ne "\e[35m"
}

function foreground_cyan {
  echo -ne "\e[36m"
}

function foreground_white {
  echo -ne "\e[37m"
}

function foreground_reset {
  echo -ne "\e[39m"
}


#
# background colors
#
function background_black {
  echo -ne "\e[40m"
}

function background_red {
  echo -ne "\e[41m"
}

function background_green {
  echo -ne "\e[42m"
}

function background_yellow {
  echo -ne "\e[43m"
}

function background_blue {
  echo -ne "\e[44m"
}

function background_magenta {
  echo -ne "\e[45m"
}

function background_cyan {
  echo -ne "\e[46m"
}

function background_white {
  echo -ne "\e[47m"
}

function background_reset {
  echo -ne "\e[49m"
}


#
# logger
#
function log_error {
  error_code=$1
  error_title=$2
  error_description=$3
  fix_with=$4
  other_messages=$5

  echo -e "$(foreground_red)$(cat <<EOT
Error: ${error_code} - ${error_title}
${error_description}
Fix with: ${fix_with}
${other_messages}
EOT
)\n$(text_reset)"
}

log_error \
  "EPERM" \
  "Invalid permissions on myfile.out" \
  "Cannot write to myfile.out, file does not have write permissions." \
  "chmod +w myfile.out" \
  "https://github.com/jdxcode/myapp"

echo "XX$(text_underscore)XX $(text_inverse)Y$(foreground_green)YY$(foreground_white)Y$(text_inverse_off) ZZ$(text_reset)ZZ"
