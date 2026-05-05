# Contributor Guidelines

## Purpose

This repository publishes small GHCR images derived from the official Playwright Docker images. The only intended difference is that CI-friendly system packages, currently `curl` and `unzip`, are preinstalled.

## Image Versions

Published tags should match upstream Playwright image tags:

```text
ghcr.io/north-brook/fast-playwright:v<playwright-version>-<ubuntu-release>
```

Example:

```text
ghcr.io/north-brook/fast-playwright:v1.59.1-noble
```

Consumers should use the tag that matches their installed `@playwright/test` or `playwright` package version.

## Publishing a New Playwright Version

Use the `Publish` GitHub Actions workflow with `workflow_dispatch`.

Inputs:

- `playwright-version`: version without the leading `v`, for example `1.59.1`
- `ubuntu-release`: upstream Playwright Ubuntu suffix, usually `noble`

The workflow builds from:

```text
mcr.microsoft.com/playwright:v<playwright-version>-<ubuntu-release>
```

and publishes:

```text
ghcr.io/north-brook/fast-playwright:v<playwright-version>-<ubuntu-release>
ghcr.io/north-brook/fast-playwright:latest
```

Before publishing a new version, verify that the upstream Playwright image exists:

```bash
docker build --build-arg PLAYWRIGHT_TAG=v1.59.1-noble -t fast-playwright:1.59.1-check .
```

After publishing, verify the image can be pulled anonymously:

```bash
docker pull ghcr.io/north-brook/fast-playwright:v1.59.1-noble
```

If anonymous pulls fail with `denied` or `unauthorized`, check the GHCR package visibility and make sure the package is public.

## Defaults

The Dockerfile defaults to:

```text
PLAYWRIGHT_TAG=v1.58.2-noble
```

Normal pushes to `main` publish the default tag plus `latest`. Manual workflow dispatch is the preferred path for adding newer versioned tags.
