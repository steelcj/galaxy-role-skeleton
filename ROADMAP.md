# Roadmap

## Next

### Run tools/test-skeleton.sh --full

Run the full Molecule test of a generated role against Incus, and record the result in the changelog.

## If needed

### More platforms

Add Molecule platforms for Ubuntu, Fedora and the RHEL family when a role needs them, with the matching entries in `meta/main.yml` and the prepare step.

### CI

The scenario needs an Incus host, so it cannot run on GitHub's hosted runners as it stands. A self-hosted runner with Incus, or a second scenario on a container driver CI supports, would give generated roles CI.

### Other role types

Variants for roles that place configuration files or templates, built from `steelcj.foomuuri`'s template and check pattern.
