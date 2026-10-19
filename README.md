# homebrew-tap
Homebrew tap for Unalyze Connect

Unalyze Connect is the desktop app that syncs your MetaTrader 5 accounts with Unalyze from your own computer. The `unalyze-connect-staging` cask installs the build for the Unalyze staging environment.

## Install

Requirements: a Mac with Apple silicon, macOS 14 or later.

```sh
brew install --cask revai-ai/tap/unalyze-connect-staging
```

This build is not notarized by Apple yet, so macOS blocks its first launch. In the “Unalyze Connect” Not Opened dialog click Done, not Move to Trash (the default button), then open System Settings → Privacy & Security and choose Open Anyway.

Then open Unalyze Connect and choose Sign in…: Unalyze opens in your browser, where you check the code and allow Unalyze Connect.

Unalyze Connect updates itself, so `brew upgrade` leaves it alone.

## Uninstall

Homebrew leaves the saved sign-in in the Keychain, so after `brew uninstall --zap` run the uninstall script as well. It removes the app with its start at login, saved sign-in and data:

```sh
brew uninstall --zap --cask revai-ai/tap/unalyze-connect-staging
curl --proto '=https' --tlsv1.2 -fsSL https://unalyze-web.vercel.app/connect/install.sh | sh -s -- --uninstall
```

A Mac still listed under Connected devices in Unalyze (Settings → Connect) can be revoked there.

## Maintainers

`brew audit --cask --online --strict revai-ai/tap/unalyze-connect-staging` fails from a `mise run publish` until the tap PR with the cask it prints is merged: livecheck reads the feed's `latest.json`, so the tap lags the feed until then.
