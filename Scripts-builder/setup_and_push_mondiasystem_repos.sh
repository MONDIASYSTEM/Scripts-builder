#!/usr/bin/env bash

# Script to create and setup initial repositories structure for MONDIASYSTEM
set -e

# Array of repositories to create
repos=(
    "msy-auth-core"
    "msy-pay-secure"
    "msy-dashboard"
    "msy-vault"
)

for repo in "${repos[@]}"; do
    echo "Creating repository: $repo"
    # Create the repository
git checkout -b $repo

    # Create scaffold structure
    echo "# $repo" > README.md
    echo "Apache-2.0 License" > LICENSE
    echo "node_modules/\ndist/\n.env" > .gitignore
    echo "{\n  \"name\": \"$repo\",\n  \"version\": \"1.0.0\",\n  \"main\": \"index.js\"\n}" > package.json
    mkdir -p src
    echo "console.log('Hello from $repo');" > src/main.ts
    git add .
git commit -m "chore: initial scaffold + setup script"
done

# Push all repositories
for repo in "${repos[@]}"; do
    git push origin $repo
    git checkout main
done

