ARG PLAYWRIGHT_TAG=v1.58.2-noble
FROM mcr.microsoft.com/playwright:${PLAYWRIGHT_TAG}

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*
