#!/bin/bash
set -eo pipefail
set -x

step_result=$(buildkite-agent step get "outcome" --step "one")

if [ "$step_result" = "passed" ]; then
    cat <<YAML
steps:
  - command: "echo 'Step has passed'"
    notify:
      - email: "athreya@buildkite.com"
YAML
#else
#    cat <<YAML
#steps:
#  - command: "echo 'It failed'"
#    notify:
#      - email: "athreya@buildkite.com"
#YAML
fi

