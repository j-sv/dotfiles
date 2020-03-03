__fuzzy_day_weekday(){
  LC_ALL=C date +'%A' | tr '[A-Z]' '[a-z]'
}

__fuzzy_day_month(){
  LC_ALL=C date +'%B' | tr '[A-Z]' '[a-z]'
}

__fuzzy_day_dom(){
  local -r n="$(LC_ALL=C date +'%d')"

  case "$n" in
    01) echo "${n:1}st";;
    02) echo "${n:1}nd";;
    03) echo "${n:1}d";;
    0*) echo "${n:1}th";;
    1*) echo "${n}th";;
    [2-3]0) echo "${n}th";;
    [2-3]1) echo "${n}st";;
    [2-3]2) echo "${n}nd";;
    2*) echo "${n}th";;
  esac
}

__fuzzy_day(){
  printf "$(__fuzzy_day_weekday), $(__fuzzy_day_month) $(__fuzzy_day_dom)"
}
