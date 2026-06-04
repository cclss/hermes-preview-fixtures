# hermes-preview-fixtures

hermes-cloud **Preview(Spec 0015) 배포 E2E**용 fixture 저장소.
각 **시나리오 = 브랜치**다(공통 히스토리 없는 orphan 브랜치). 이 `main` 브랜치는 안내문만 둔 랜딩이다.

## 시나리오 브랜치

| 브랜치 | 내용 | E2E 시나리오 |
|---|---|---|
| `static` | 루트 `index.html`+`app.css` (SPA fallback) | V1 Static·V7 레이어드 대기 |
| `vite` | `package.json`(순수 셸 build → `dist/`, node_modules 불요) | V2 Build→Static |
| `phx-live` | 실 `mix phx.new` LiveView + Ecto + 샘플 마이그레이션, `check_origin: true` | V3 Server·V4 WS(통과)·V5 env |
| `phx-strict` | LiveView + 하드코딩 `check_origin: ["https://app.example.com"]` | V4 WS(거부 → `ws_origin_rejected`) |
| `env` | phx + 외부키 lazy(`STRIPE_KEY`) + `GET /__env`(주입값 노출) | V5·`job_preview {env}` |
| `toml` | phx-live + 루트 `preview.toml`(model/serve/[env]) | 선언(manifest) 사다리 |
| `monorepo` | `apps/a`+`apps/b` 각 package.json, manifest 없음 | `needs_target` 진단 |
| `docker` | `docker-compose.yml`만 | `container_only` 진단 |

## 사용

daemon이 `job_create`의 `base_branch`로 해당 브랜치를 clone한다:
```bash
# 예: Server 시나리오
hermes:job_create { repository_url: "https://github.com/cclss/hermes-preview-fixtures.git", base_branch: "phx-live", ... }
hermes:job_preview { job_id: "<job>" }
```
- 절차: hermes-cloud `docs/playbooks/0015-preview-deployed-e2e.md`
- 생성 스크립트(부트스트랩 기록): hermes-cloud `tools/test/e2e-fixtures-setup.sh`

## 브라우징/편집
```bash
git switch phx-live    # 해당 시나리오로 (orphan 브랜치라 트리 전체가 바뀜)
# 수정 → commit → push
```

> 더미 테스트 앱(시크릿 없음). public.
