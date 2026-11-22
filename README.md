# galaxy-role-skeleton

A skeleton for `ansible-galaxy role init` that creates a new Ansible role ready to test and publish. Its structure and conventions follow the roles of [Robert de Bock](https://github.com/robertdebock), and it was rebuilt from [`steelcj.foomuuri`](https://github.com/steelcj/ansible-role-foomuuri), the first role made this way.

## What a new role gets

- `tasks/assert.yml`, imported once on the controller, to check the role's variables before anything runs.
- Per-distribution package names in `vars/main.yml`, looked up by distribution and major version, then distribution, then OS family, then `default`.
- Fully qualified module names, handlers for restarts, and connections to skip for services, such as Docker containers.
- A Molecule scenario that launches `images:debian/13` as an Incus system container, converges the role over `incus exec`, checks idempotence, verifies and deletes the container.
- A README in Robert de Bock's format, with a table for recording test results, plus `ROADMAP.md`, `CHANGELOG.md` and an MIT `LICENSE`.
- `en/docs/guides/manual-testing/`, with a guide to running the Molecule scenario by hand, and `en/docs/sessions/` for session records.
- `yamllint` and `ansible-lint` settings. A new role passes both, with the production profile, before any change.

New roles use the `steelcj` namespace and the MIT license.

## Requirements

- ansible-core 2.15 or later, with `ansible-galaxy`.
- To test new roles: Molecule, ansible-lint, yamllint, the `incus` client with permission to use it, and the `community.general` collection, which the scenario installs itself.

## Create a role

Use a short name with letters, digits and underscores, since it also prefixes the role's variables. The repository takes the long name, `ansible-role-<name>`.

```sh
cd ~/src
ansible-galaxy role init --role-skeleton=~/src/galaxy-role-skeleton/skeleton my_role
mv my_role ansible-role-my_role
cd ansible-role-my_role
molecule test
```

The role is used as `steelcj.my_role`. Its Incus test container is named `my-role-debian13`, since Incus does not allow underscores in instance names.

Then fill in the role:

1. Add the packages to `_my_role_packages` in `vars/main.yml`, and the service, if any, to `my_role_service` in `defaults/main.yml`.
2. Add variables to `defaults/main.yml`, and a check for each to `tasks/assert.yml`.
3. Add the role's tasks to `tasks/main.yml`, and checks for them to `molecule/default/verify.yml`.
4. Keep the README's Example Playbook and Role Variables sections in step with `converge.yml` and `defaults/main.yml`.
5. Run `molecule test`, and record the result in the README's Testing table.

## Test the skeleton

```sh
tools/test-skeleton.sh
tools/test-skeleton.sh --full
```

The first generates a role in a temporary directory and runs yamllint, ansible-lint and `molecule syntax` on it. `--full` also runs `molecule test` against Incus.

## Roadmap

See [ROADMAP.md](ROADMAP.md).

## License

MIT, see [LICENSE](LICENSE).

## Author

Christopher Steel
