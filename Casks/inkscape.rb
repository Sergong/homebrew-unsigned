cask "inkscape" do
  # 1. Define architecture-specific variables
  # Inkscape uses different URL paths for M1/M2/M3 (dmg-arm64) vs Intel (dmg)
  arch arm: "dmg-arm64", intel: "dmg"

  version "1.4"
  sha256 "c6098819bf30b5f305e4417c88d1e623bf804aec86a4f4e5d86e00b45e65f6dd" # We skip the check initially; the automation will fill this in

  # 2. Use the STABLE redirect URL
  # Instead of guessing "Inkscape-1.4.dmg", we hit the download endpoint.
  # "dl/" at the end tells the site to trigger the file download.
  url "https://inkscape.org/release/inkscape-#{version}/mac-os-x/#{arch}/dl/"

  name "Inkscape"
  desc "Vector graphics editor"
  homepage "https://inkscape.org/"

  # 3. Livecheck updates
  # We check the main release page to find the current version number (e.g., "1.4")
  livecheck do
    url "https://inkscape.org/release/inkscape-1.4/"
    regex(/Inkscape\s+v?(\d+(?:\.\d+)+)/i)
  end

  conflicts_with cask: "inkscape-preview"

  app "Inkscape.app"
  binary "#{appdir}/Inkscape.app/Contents/MacOS/inkscape"

  zap trash: [
    "~/.config/inkscape",
    "~/Library/Application Support/Inkscape",
    "~/Library/Preferences/org.inkscape.Inkscape.plist",
  ]
end

