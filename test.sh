#!/bin/bash

step_result=$(buildkite-agent step get "outcome" --step "one")

if [ "$step_result" = "passed" ]; then
    cat <<YAML
steps:
  - command: "echo 'Step has passed'"
    label: ":white_check_mark: Step Passed"
    notify:
      email: "athreya@buildkite.com"
YAML
else
    cat <<YAML
steps:
  - command: "echo 'It failed'"
    label: ":x: Step Failed"
    notify:
      email: "athreya@buildkite.com"
YAML
fi

