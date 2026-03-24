#!/bin/bash
# Clone all emberlamp repos to /tmp/emberlamp/

ORG="emberlamp"
TARGET_DIR="/tmp/emberlamp"

# Get repos from config
REPOS=$(curl -s "https://raw.githubusercontent.com/$ORG/config/main/repos.json" | jq -r '.repos[]')

echo "Cloning all emberlamp repos to $TARGET_DIR..."

mkdir -p "$TARGET_DIR"

for repo in $REPOS; do
  if [ "$repo" = ".github" ]; then
    url="https://github.com/$ORG/.github.git"
    target="$TARGET_DIR/.github"
  else
    url="https://github.com/$ORG/$repo.git"
    target="$TARGET_DIR/$repo"
  fi
  
  if [ -d "$target" ]; then
    echo "  → $repo (already exists, skipping)"
  else
    git clone "$url" "$target" 2>/dev/null
    if [ $? -eq 0 ]; then
      echo "  ✓ $repo cloned"
    else
      echo "  ✗ $repo failed"
    fi
  fi
done

echo "Done! All repos in $TARGET_DIR"