#!/bin/bash
# rink admin rink → run/adminrink
about="Create a nologin PAM user for the rink control-panel UI (groups rink + admin|customer)."
SOu=""; SOt=""; SOe=""
while getopts "u:t:e:h" Flag; do
 case "${Flag}" in
  u) SOu="${OPTARG}" ;;
  t) SOt="${OPTARG}" ;;
  e) SOe="${OPTARG}" ;;
  h)
    /usr/bin/echo "${about}
-u username  -t admin|customer  -e email"
    exit 0 ;;
  *) exit 1 ;;
 esac
done
if [ -z "${SOu}" ] || [ -z "${SOt}" ] || [ -z "${SOe}" ]; then
  /usr/bin/echo "Need -u -t -e. Try -h"; exit 1
fi
/opt/rink/run/adminrink "${SOu}" "${SOt}" "${SOe}"
