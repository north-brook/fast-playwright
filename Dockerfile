FROM mcr.microsoft.com/playwright:v1.58.2-noble

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*
