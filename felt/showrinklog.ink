#!/bin/bash
# rink show rinklog → run/showrinklog
about="Page the rink CLI raw runner output log. Space page down, b page up, q quit. Starts at the end."
while getopts "h" Flag; do
 case "${Flag}" in
  h)
    /usr/bin/echo "${about}"
    exit 0 ;;
  *) exit 1 ;;
 esac
done
/opt/rink/run/showrinklog
