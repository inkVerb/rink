#!/bin/bash
# rink admin verb → run/adminverb (SSH to the VPS, run newverbadmin)
# Does not run from addvps.
about="Create a nologin PAM user on a verber (groups verb + admin|supervisor) via SSH."
SOn=""; SOl=""; SOr=""; SOu=""; SOt=""; SOe=""
while getopts "n:l:r:u:t:e:h" Flag; do
 case "${Flag}" in
  n) SOn="${OPTARG}" ;;
  l) SOl="${OPTARG}" ;;
  r) SOr="${OPTARG}" ;;
  u) SOu="${OPTARG}" ;;
  t) SOt="${OPTARG}" ;;
  e) SOe="${OPTARG}" ;;
  h)
    /usr/bin/echo "${about}
-n namespace  -l tld  -r rink-user (addvps USERNAME)
-u verb-username  -t admin|supervisor  -e email"
    exit 0 ;;
  *) exit 1 ;;
 esac
done
if [ -z "${SOn}" ] || [ -z "${SOl}" ] || [ -z "${SOr}" ] || [ -z "${SOu}" ] || [ -z "${SOt}" ] || [ -z "${SOe}" ]; then
  /usr/bin/echo "Need -n -l -r -u -t -e. Try -h"; exit 1
fi
/opt/rink/run/adminverb "${SOn}" "${SOl}" "${SOr}" "${SOu}" "${SOt}" "${SOe}"
