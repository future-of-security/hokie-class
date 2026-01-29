#!/usr/bin/env bash
set -euo pipefail

echo "[build] Starting production build"

# Sanity checks
command -v bundle >/dev/null || {
  echo "[build] ERROR: bundler not found"
  exit 1
}

command -v jekyll >/dev/null || {
  echo "[build] ERROR: jekyll not found"
  exit 1
}

export JEKYLL_ENV=production

echo "[build] Configuring Bundler for production (local only)"
bundle config set --local without "development test"

echo "[build] Installing Ruby dependencies"
bundle install

echo "[build] Building Jekyll site (production)"
bundle exec jekyll build --trace

# Validate output
if [ ! -d "_site" ]; then
  echo "[build] ERROR: _site directory not generated"
  exit 1
fi

if [ -z "$(ls -A _site)" ]; then
  echo "[build] ERROR: _site is empty"
  exit 1
fi

echo "[build] Build completed successfully"
