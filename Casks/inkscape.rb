cask "inkscape" do
  # 1. Define architecture-specific variables
  # Inkscape uses different URL paths for M1/M2/M3 (dmg-arm64) vs Intel (dmg)
  arch arm: "dmg-arm64", intel: "dmg"

  version "1.4"
  sha256 "6e7256f0672b94e99e0855c5d32fedbfa2d2154b30fe24d2b3a03710afb3de47" # We skip the check initially; the automation will fill this in

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

