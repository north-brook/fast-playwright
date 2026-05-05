# fast-playwright

Small GitHub Actions container image based on the official Playwright image, with the extra system packages needed by Bun preinstalled.

Published image:

```text
ghcr.io/north-brook/fast-playwright:v1.58.2-noble
ghcr.io/north-brook/fast-playwright:v1.59.1-noble
```

## Included

- `mcr.microsoft.com/playwright:<version>`
- `curl`
- `unzip`

## Usage

```yaml
container:
  image: ghcr.io/north-brook/fast-playwright:v1.58.2-noble
```

This lets E2E jobs remove the repeated apt install step:

```yaml
- name: Install Container Dependencies
  run: |
    apt-get update
    apt-get install -y unzip curl
```

## Updating Playwright

When an app upgrades Playwright, publish a matching image from the `Publish` workflow:

```text
playwright-version: 1.59.1
ubuntu-release: noble
```

This publishes:

```text
ghcr.io/north-brook/fast-playwright:v1.59.1-noble
```

The Dockerfile accepts `PLAYWRIGHT_TAG` as a build arg and defaults to `v1.58.2-noble` for normal pushes.
