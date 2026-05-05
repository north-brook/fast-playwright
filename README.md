# fast-playwright

Small GitHub Actions container image based on the official Playwright image, with the extra system packages needed by Bun preinstalled.

Published image:

```text
ghcr.io/north-brook/fast-playwright:v1.58.2-noble
```

## Included

- `mcr.microsoft.com/playwright:v1.58.2-noble`
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

When the app upgrades Playwright, update the base image tag in `Dockerfile`, then update the image tag in `.github/workflows/publish.yml`.
