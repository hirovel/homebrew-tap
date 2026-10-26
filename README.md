# hirovel Homebrew tap

Focused writing in your terminal with [Novelite TUI](https://github.com/hirovel/novelite-tui).

For macOS on Apple Silicon (M1 and later):

```sh
brew install hirovel/tap/novelite-tui
novelite-tui
```

Update with:

```sh
brew update && brew upgrade novelite-tui
```

Your manuscripts and preferences stay outside Homebrew's installation directory. Updating or removing the package does not remove them. The application follows your terminal's font, cursor and background; use F4 → 写作 → 专注写作 to temporarily hide the surrounding tools.

## Maintaining the formula

After publishing a stable Novelite TUI release, run this from its source repository with GitHub CLI signed in:

```sh
python3 scripts/release.py update-tap --tag v0.1.0 --tap ../homebrew-tap
```

The command verifies the published archive and checksum before updating `Formula/novelite-tui.rb`. Review and commit that file, then run this tap's **Verify Apple Silicon installation** workflow. No cross-repository token is required.
