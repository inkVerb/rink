# admin

## Web UI PAM users
- `rink admin rink` — this box (groups `rink` + `admin`|`customer`)
- `rink admin verb` — a VPS via SSH (groups `verb` + `admin`|`supervisor`)
- Not called from `addvps`. The web UI calls `adminverb` after the box exists.
- No UI can create admins for itself.
