# preview-fixture: phx-live (branch)
Phoenix LiveView + Ecto(Postgres). Server model, isolated DB at preview time.
Prod Endpoint check_origin: true → PHX_HOST 기반 Origin 허용(V4 pass / wss 101).
priv/repo/migrations 에 create_e2e_marker → 격리 DB 에서 mix ecto.migrate 가 실 테이블 생성(V3).
루트 `/` 는 실 LiveView(PageLive) — wss 연결 시 connected?=true → "wss: connected" + 틱 카운터 증가(V4 101 증거).
