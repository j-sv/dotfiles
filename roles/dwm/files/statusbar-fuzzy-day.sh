__fuzzy_day_weekday(){
  LC_ALL=C date +'%A' | tr '[A-Z]' '[a-z]'
}

__fuzzy_day_month(){
  LC_ALL=C date +'%B' | tr '[A-Z]' '[a-z]'
}

__fuzzy_day_dom(){
  local -r n="$(LC_ALL=C date +'%d')"

  case "$n" in
    01) echo "${n}st";;
    02) echo "${n}nd";;
    03) echo "${n}d";;
    [0-1]*) echo "${n}th";;
    [2-3]0) echo "${n}th";;
    [1-3]1) echo "${n}st";;
  esac
}

__fuzzy_day(){
  printf "$(__fuzzy_day_weekday), $(__fuzzy_day_month) $(__fuzzy_day_dom)"
}
