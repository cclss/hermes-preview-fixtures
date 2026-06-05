# preview-fixture: env-required (branch)
Phoenix(NO-ECTO) + runtime.exs 가 STARTUP-REQUIRED 외부키(STRIPE_KEY)를 fetch_env! 로 읽는다(폴백 없음 = C2).
ecto 가 없어 migrate 단계가 없으므로, 미설정이면 SERVE 단계(mix phx.server prod 부팅)에서 비로소 raise
→ serve 즉시 종료 → daemon 이 teardown 하지 않고 live :needs_env 로 살아있음(SERVE-phase needs_env).
Cloud 가 같은 URL 에 입력 폼(503)을 서빙 → 입력(POST /_preview/:hash/env, capability=hash)
→ Cloud update_preview_env(암호화) → daemon 폴(get_preview_state)이 감지 → serve 만 in-place 재실행 → running.
GET /__env → 주입된 STRIPE_KEY 값(end-to-end env 흐름 관측). 취소 버튼 → /_preview/:hash/cancel → 정리(V6).
