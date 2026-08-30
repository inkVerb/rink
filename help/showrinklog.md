# show rinklog

## This pages the rink CLI raw runner output log
- `rink show rinklog`
- Same keys as journalctl: space page down, b page up, q quit
- Opens at the end of the file (newest output)
- File: `rink/log/outputlog` (also `/var/log/rink/outputlog`)
- Command notices are in `rinklog` in the same directory
- The rink dispatcher tees each run to this log and still prints live on the terminal
