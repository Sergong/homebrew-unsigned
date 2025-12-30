# How to use your this Tap
Now that your repo is live and up-to-date, you can use it on your Mac to install these apps without the warning warnings:

## Add your tap:

```bash
brew tap <your-github-username>/homebrew-unsigned
# (Use the actual name of your repo if it isn't "homebrew-unsigned")
```

## Install the Apps:

```bash
brew install --cask <your-github-username>/unsigned/librewolf
brew install --cask <your-github-username>/unsigned/inkscape
```

## Bypass Gatekeeper (One time):
Remember to run your brew-unsafe function or manually strip the quarantine attribute, as these are still unsigned apps:

```bash
xattr -r -d com.apple.quarantine /Applications/LibreWolf.app
xattr -r -d com.apple.quarantine /Applications/Inkscape.app
```

> The github actions automation will now run every day at 08:27 UTC. If a new version is released, it will automatically bump the file, calculate the hash, and push it, making it available to your local brew upgrade immediately.

