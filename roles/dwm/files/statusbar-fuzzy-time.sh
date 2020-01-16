__fuzzy_time_hour(){
  local hour="$(echo "$(date +'%I') % 12" | bc)"

  if [ $(date +'%M') -gt 30 ]; then
    hour="$(echo "$hour + 1" | bc)"
  fi

  case "${hour}" in
    0) echo "twelve";;
    1) echo "one";;
    2) echo "two";;
    3) echo "three";;
    4) echo "four";;
    5) echo "five";;
    6) echo "six";;
    7) echo "seven";;
    8) echo "eight";;
    9) echo "nine";;
    10) echo "ten";;
    11) echo "eleven";;
  esac
}

__fuzzy_time_minute(){
  echo "$(LC_ALL=C printf "%.0f" $(echo "scale=2; $(date +'%M') / 5.0" | bc)) * 5" | bc
}

__fuzzy_time_minute_str(){
  case "$1" in
    5) echo 'five past';;
    10) echo 'ten past';;
    15) echo 'quarter past';;
    20) echo 'twenty past';;
    25) echo 'twenty-five past';;
    30) echo 'half past';;
    35) echo 'twenty-five to';;
    40) echo 'twenty to';;
    45) echo 'quarter to';;
    50) echo 'ten to';;
    55) echo 'five to';;
  esac
}

__fuzzy_time(){
  m="$(__fuzzy_time_minute)"

  if [ $m -eq 0 -o $m -eq 60 ]; then
    printf "$(__fuzzy_time_hour) o'clock"
  else
    printf "$(__fuzzy_time_minute_str $m) $(__fuzzy_time_hour)"
  fi
}
