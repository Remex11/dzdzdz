#!/usr/bin/env sh

set -eu

git config core.hooksPath .githooks
chmod +x .githooks/pre-commit .githooks/commit-msg .githooks/pre-push
chmod +x scripts/build.sh scripts/test.sh

echo "Git hooks were installed through core.hooksPath=.githooks"
