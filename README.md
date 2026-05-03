# Pebble App Template

A GitHub template that provides a Docker-based build pipeline and GitHub Actions CI for Pebble apps. Produces `.pbw` artifacts on every push and GitHub Releases on version tags.

## Getting started

1. Click **Use this template** → **Create a new repository**
2. Clone your new repository
3. Scaffold your app:

```bash
pebble new-project my-app        # or: --javascript, --alloy
cp -r my-app/src my-app/wscript my-app/package.json .
rm -rf my-app
```

Commit the result.

4. Edit `package.json` to set your UUID, display name, target platforms, and whether it's a watchface or app.
5. Push — CI builds your `.pbw` automatically.

## Building

```bash
make docker-run        # build with Docker (no local SDK required)
make build             # build with local pebble-tool
make pt1               # build + run on basalt emulator (Pebble Time)
make pt2               # build + run on emery emulator (Pebble Time 2)
```

### Installing pebble-tool locally

```bash
uv tool install pebble-tool --python 3.13
pebble sdk install latest
```

## Releasing

```bash
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions creates a release with the `.pbw` attached automatically.
