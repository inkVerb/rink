# update

## This refreshes the rink engine from GitHub
- Runners, felt, help, dispatcher, and web UI source
- Sequential version patches (same idea as `updateverber` / verb-update)
- Does not replace `conf/`, `ns/`, `snapshotid/`, or `rinknames`
- If the web UI is already installed, the Go binary is rebuilt and restarted

## Schemas
- `rink update rink`
