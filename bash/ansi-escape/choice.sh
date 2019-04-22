#!/usr/bin/env bash

#
# show / hide cursor
#
function show_cursor {
  echo -ne "\e[?25h"
}

function hide_cursor {
  echo -ne "\e[?25l"
}


#
# cursor position
#
function set_cursor_position {
  echo -ne "\e[$1;${2:-1}H"
}

function get_cursor_position {
  IFS=';' read -s -d R -p $'\e[6n' -a pos
  row=$((${pos[0]:2} - 1))
  col=$((${pos[1]} - 1))
  echo ${row} ${col}
}

function get_cursor_row {
  read -s -a pos < <(get_cursor_position)
  echo ${pos[0]}
}

function get_cursor_col {
  read -s -a pos < <(get_cursor_position)
  echo ${pos[1]}
}


#
# user input
#
function read_user_input {
  read -s -n 1 heading 2>/dev/null >&2
  if [[ $heading = "" ]]; then
    echo enter
    return
  fi
  if [[ $heading != $'\x1b' ]]; then
    return
  fi
  read -s -n 2 trailing 2>/dev/null >&2
  if [[ $trailing = [A ]]; then
    echo up
    return
  fi
  if [[ $trailing = [B ]]; then
    echo down
    return
  fi
}

function show_keycode {
  read key
  echo "$key" | hexdump
}


#
# choice
#
function choice_options {
  for opt; do
    echo ""
  done

  local lastrow=`get_cursor_row`
  local startrow=$(($lastrow - $#))

  hide_cursor

  local selected=0
  while true; do
    local idx=0
    for opt; do
      set_cursor_position $(($startrow + $idx))
      if [[ $idx -eq $selected ]]; then
        echo -e "  [$opt]"
      else
        echo -e "   $opt "
      fi
      ((idx++))
    done

    case `read_user_input` in
      enter)
        break
        ;;
      up)
        ((selected--));
        if [[ $selected -lt 0 ]]; then
          selected=$(($# - 1))
        fi
        ;;
      down)
        ((selected++));
        if [[ $selected -ge $# ]]; then
          selected=0
        fi
        ;;
    esac
  done

  set_cursor_position $lastrow
  echo ""
  show_cursor

  return $selected
}

echo "Select one option using up/down keys and enter to confirm:"
echo

options=("one" "two" "three")

choice_options "${options[@]}"
choice=$?

echo "Choosen index = $choice"
echo "        value = ${options[$choice]}"
