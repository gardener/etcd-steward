#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2024 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0



set -e

echo "> Adding Apache License header to all go files where it is not present"

# Uses the tool https://github.com/google/addlicense
YEAR="$(date +%Y)"
addlicense \
  -c "SAP SE or an SAP affiliate company" \
  -y "${YEAR}" \
  -l apache \
  -ignore ".idea/**" \
  -ignore ".vscode/**" \
  -ignore "vendor/**" \
  -ignore "**/*.md" \
  -ignore "**/*.yaml" \
  -ignore "**/Dockerfile" \
  .
