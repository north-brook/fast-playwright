# fast-playwright

Small GitHub Actions container image based on the official Playwright image, with the extra system packages needed by Bun preinstalled.

## Images

- `ghcr.io/north-brook/fast-playwright:v1.58.2-noble`
- `ghcr.io/north-brook/fast-playwright:v1.59.1-noble`

## Included

- Official Playwright base image
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

Use an image tag that matches the app's installed Playwright version.
