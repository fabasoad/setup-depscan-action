# Setup depscan GitHub Action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release](https://img.shields.io/github/v/release/fabasoad/setup-depscan-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-depscan-action/actions/workflows/functional-tests.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-depscan-action/actions/workflows/linting.yml/badge.svg)
![security](https://github.com/fabasoad/setup-depscan-action/actions/workflows/security.yml/badge.svg)

This action sets up a [depscan](https://depscan.readthedocs.io/) CLI tool.

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :white_check_mark: |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Prerequisites

None.

## Inputs

```yaml
- uses: fabasoad/setup-depscan-action@v1
  with:
    # (Optional) depscan version. Defaults to the latest version.
    version: "6.1.0"
    # (Optional) If "false" skips installation if depscan is already installed.
    # If "true" installs depscan in any case. Defaults to "false".
    force: "false"
    # (Optional) GitHub token that is used to send requests to GitHub API such
    # as getting latest release. Defaults to the token provided by GitHub Actions
    # environment.
    github-token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                          | Example |
|-----------|--------------------------------------|---------|
| installed | Whether depscan was installed or not | `true`  |
<!-- prettier-ignore-end -->

## Example usage

```yaml
name: Setup depscan

on: push

jobs:
  example:
    name: Example
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: fabasoad/setup-depscan-action@v1
      - name: Run CLI
        run: depscan --version
```

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/58a8539fe80d0fc54f758b975ce39aa91ace9fa7.svg "Repobeats analytics image")
