# Changelog

## 2.0.0 (2026-11-22)

Rebuilt from `steelcj.foomuuri` and Robert de Bock's conventions. Roles made from 1.x are unaffected, but the skeleton itself is not compatible with it.

- Removed: per-version task files for CentOS 5 to 7, Debian 6 to 9 and Ubuntu 12.04 to 18.04, `include:`, `static:` and `with_first_found`, Travis CI, Vagrant and VirtualBox testing, Molecule's `lxd` driver and `testinfra` verifier, the debug tasks, `cjsteel.resources` and `acemenu` hooks, and the MCIN branding and images.
- Added: `tasks/assert.yml`, per-distribution package names with a fallback chain, fully qualified modules, a handler, skipped connections, an Incus Molecule scenario on `images:debian/13` with create, prepare, converge, idempotence, verify, cleanup and destroy, a README in Robert de Bock's format, `ROADMAP.md`, `CHANGELOG.md`, an MIT `LICENSE`, the Molecule testing guide, a sessions directory, `yamllint` and `ansible-lint` settings, and `tools/test-skeleton.sh`.
- New roles use the `steelcj` namespace and the MIT license.

## 1.x (2018 to 2021)

The original skeleton, for Ansible 2.x with Vagrant, Travis CI and Molecule's `lxd` driver.
