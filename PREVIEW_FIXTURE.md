# preview-fixture: phx-strict (branch)
Phoenix LiveView + Ecto, but check_origin HARDCODED to ["https://app.example.com"].
Preview Origin 이 일치하지 않으므로 wss 업그레이드 403 → ws_origin_rejected 진단(V4 reject).
루트 `/` 는 실 LiveView(PageLive) — wss 거부 시 connected?=false → "wss: static" + 틱 카운터 0 고정(V4 reject 증거).
