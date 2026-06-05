# preview-fixture: env-required-ecto (branch)
Phoenix + Ecto(Postgres) + runtime.exs 최상위에 STARTUP-REQUIRED 외부키(STRIPE_KEY) fetch_env!(폴백 없음 = C2).
ecto 가 있으므로 daemon 이 serve 전에 mix ecto.migrate(prod) 를 돌리는데, migrate 가 runtime.exs 를 평가하면서
fetch_env! 가 먼저 raise → MIGRATE 단계에서 boot-fail(serve 도달 전) → daemon 이 teardown 하지 않고 live :needs_env
로 살아있음(MIGRATE-phase needs_env). Cloud 가 같은 URL 에 입력 폼(503)을 서빙 → 입력(POST /_preview/:hash/env)
→ Cloud update_preview_env(암호화) → daemon 폴이 감지 → resume 가 migrate 부터 재실행 → 성공 → serve → running.
priv/repo/migrations 에 create_e2e_marker → 격리 DB 에서 실 테이블 생성(needs_db). GET /__env → 주입된 STRIPE_KEY 값.
