# Emberlamp Hub

Central hub for the emberlamp organization - connects all repositories.

## Overview

Emberlamp is a fully automated organization with 14 repositories managed through centralized control.

## Architecture

```
       ┌───────────┐
       │  config   │
       │repos.json │
       └─────┬─────┘
             │
┌────────────┼────────────┐
│            │            │
▼            ▼            ▼
 skills   swe-agent    bot
 repo      repo       repo
  └─────────┴──────────┘
            │
            ▼
       ┌──────────┐
       │   hub    │
       │(this one)│
       └──────────┘
```

## Repositories

### Core Control
| Repo | Purpose |
|------|---------|
| [hub](https://github.com/emberlamp/hub) | This hub - central entry point |
| [config](https://github.com/emberlamp/config) | Single source of truth (repos.json) |
| [skills](https://github.com/emberlamp/skills) | Agent capabilities & CLI extensions |
| [swe-agent](https://github.com/emberlamp/swe-agent) | Software engineering agent |
| [bot](https://github.com/emberlamp/bot) | Automation workflows |

### Applications
| Repo | Purpose |
|------|---------|
| [general](https://github.com/emberlamp/general) | Main application |

### Templates
| Repo | Purpose |
|------|---------|
| [react-template](https://github.com/emberlamp/react-template) | React + Vite + TypeScript |

### CLI Tools
| Repo | Purpose |
|------|---------|
| [cli](https://github.com/emberlamp/cli) | Master CLI for all repos |
| [gh-pin-repo](https://github.com/emberlamp/gh-pin-repo) | CLI for pinning repos |

### Resources
| Repo | Purpose |
|------|---------|
| [license](https://github.com/emberlamp/license) | MIT License |
| [warnings](https://github.com/emberlamp/warnings) | Warning messages |
| [json-repo](https://github.com/emberlamp/json-repo) | JSON schemas |
| [gitkeep](https://github.com/emberlamp/gitkeep) | Placeholder |

## Quick Start

```bash
# Clone all repos to /tmp/emberlamp/
git clone https://github.com/emberlamp/swe-agent.git /tmp/swe-agent
cd /tmp/swe-agent
python agent.py clone-all

# List all repos
python agent.py list

# Check agent capabilities
python agent.py capabilities
```

## Automated Workflows

Each repo has 3 workflows:
- **CI** - Lint & test on push to main
- **Release** - Auto version bump & release on push
- **Automation** - Sync, backup, report (schedule/manual)

### Trigger Release on All Repos

```bash
# Run release workflow on all 14 repos
for repo in general react-template swe-agent gh-pin-repo config cli bot license warnings json-repo gitkeep skills hub; do
  gh workflow run release.yml -R emberlamp/$repo &
done
wait

# Check results
for repo in general react-template swe-agent gh-pin-repo config cli bot license warnings json-repo gitkeep skills hub; do
  gh run list --repo emberlamp/$repo --limit 1
done
```

### Manual Release with Version

```bash
# Trigger specific version bump
gh workflow run release.yml -f version=minor -R emberlamp/hub
gh workflow run release.yml -f version=patch -R emberlamp/hub
```

## Documentation

- [Config Repo](https://github.com/emberlamp/config) - Repository list
- [Skills Repo](https://github.com/emberlamp/skills) - Agent capabilities
- [.github Profile](https://github.com/emberlamp/.github) - Org overview

## License

MIT License - See [license](https://github.com/emberlamp/license)

© 2026 Emberlamp