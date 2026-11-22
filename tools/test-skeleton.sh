#!/bin/sh
# Generate a role from the skeleton and check it: yamllint, ansible-lint with
# the production profile, and Molecule's syntax step. Pass --full to also run
# "molecule test", which needs a working Incus installation.
#
# Usage: tools/test-skeleton.sh [--full] [role_name]

set -eu

full=false
if [ "${1:-}" = "--full" ]; then
    full=true
    shift
fi
role_name="${1:-skeleton_check}"

repo="$(cd "$(dirname "$0")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

cd "$work"
ansible-galaxy role init --role-skeleton="$repo/skeleton" "$role_name" >/dev/null
mv "$role_name" "ansible-role-$role_name"
cd "ansible-role-$role_name"

if grep -rn '{{ role_name }}' . ; then
    echo "test-skeleton: unrendered role_name above" >&2
    exit 1
fi

yamllint .
ansible-lint
molecule syntax

if [ "$full" = true ]; then
    molecule test
fi

echo "test-skeleton: ansible-role-$role_name passed"
