# preview-fixture: env (branch)
Phoenix + Ecto + runtime.exs 가 OPTIONAL 외부키(STRIPE_KEY)를 default 와 함께 읽는다.
미설정이어도 raise 없이 부팅(C1 낙관부팅). job_preview{env:{STRIPE_KEY:...}} 주입 검증용.
GET /__env → 요청 시점 System.get_env("STRIPE_KEY")(없으면 "unset") 평문 반환.
  주입값을 배포 후 CURL 로 end-to-end 관측(3b-1). runtime.exs lazy read 는 그대로(키 없이 부팅).
