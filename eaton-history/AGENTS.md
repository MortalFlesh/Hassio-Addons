# Eaton History — Home Assistant Add-on

Home Assistant add-on that connects to an Eaton controller, fetches device history/states, and exposes them as entities via a built-in web server.

## Architecture

- **Runtime**: Alpine 3.19 Docker image, `aarch64` only
- **Core binary**: Pre-built .NET binary from [MortalFlesh/home-console](https://github.com/MortalFlesh/home-console/releases) — no source code in this repo
- **Web server**: `home-console home:web:run` on port `28080`, exposed via HA ingress
- **Config**: `eaton_host`, `eaton_name`, `eaton_password` — passed at runtime via `bashio::config`

## Key Files

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds the image; `CONSOLE_VERSION` controls which binary release is fetched |
| `config.yaml` | HA add-on manifest — version, arch, ingress, options schema |
| `run.sh` | Entrypoint; reads HA config and launches the binary |
| `build.yaml` | Base image override for the HA build system |
| `CHANGELOG.md` | Version history |

## Updating the Add-on

When a new `home-console` release is available:

1. Update `CONSOLE_VERSION` in `Dockerfile`
2. Update `version` in `config.yaml` to match
3. Add an entry to `CHANGELOG.md`

New release URL to check: https://github.com/MortalFlesh/home-console/releases

## Build & Test

The image is built by the HA add-on build system using `build.yaml`. To build locally:

```bash
docker build --build-arg BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.19 -t eaton-history .
```

No automated tests — validate by installing the add-on in Home Assistant and checking the ingress panel.
