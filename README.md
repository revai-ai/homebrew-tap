# homebrew-tap
Homebrew tap for Unalyze Connect

Unalyze Connect is the desktop app that syncs your MetaTrader 5 accounts with Unalyze from your own computer. The `unalyze-connect-staging` cask installs the build for the Unalyze staging environment.

## Install

Requirements: a Mac with Apple silicon, macOS 14 or later.

```sh
brew install --cask revai-ai/tap/unalyze-connect-staging
```

This build is not notarized by Apple yet, so macOS blocks its first launch. In the “Unalyze Connect (staging)” Not Opened dialog click Done, not Move to Trash (the default button), then open System Settings → Privacy & Security and choose Open Anyway.

Then open Unalyze Connect (staging) and choose Sign in…: Unalyze opens in your browser, where you check the code and allow Unalyze Connect.

Unalyze Connect updates itself, so `brew upgrade` leaves it alone.

## Uninstall

`brew uninstall --zap` removes the app with its start at login and data. Homebrew leaves the saved sign-in and the accounts' investor passwords in the Keychain, so delete them as well:

```sh
brew uninstall --zap --cask revai-ai/tap/unalyze-connect-staging
while security delete-generic-password -s com.un-alyze.connect.staging >/dev/null 2>&1; do :; done
```

A Mac still listed under Connected devices in Unalyze (Settings → Connect) can be revoked there.

## Maintainers

`brew audit --cask --online --strict revai-ai/tap/unalyze-connect-staging` fails from a `mise run publish` until the tap PR with the cask it prints is merged: livecheck reads the feed's `latest.json`, so the tap lags the feed until then.
