# tonhowtf/homebrew-tap

Homebrew tap for [OmniGet](https://getomniget.com), a free, open source desktop app whose main part is a local MCP server that gives coding agents a desktop toolbox. Source: [tonhowtf/omniget](https://github.com/tonhowtf/omniget).

```bash
brew install --cask tonhowtf/tap/omniget
```

The cask downloads the same `.dmg` as [getomniget.com/download](https://getomniget.com/download) and checks its SHA-256. OmniGet updates itself after that.

OmniGet is not notarized by Apple yet. If macOS says the app is damaged, run:

```bash
xattr -cr /Applications/omniget.app
codesign --force --deep --sign - /Applications/omniget.app
```
