cask "librewolf" do
  arch arm: "arm64", intel: "x86_64"

  version "134.0-1" # This line gets updated by the bot
  sha256 "d9b278ffc5e902382526e080025e6062f5556b9d729f2d6e4c90647dbf6f9f43" # Updated by bot

  url "https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/#{version}/librewolf-#{version}-macos-#{arch}-package.dmg",
      verified: "gitlab.com/"

  name "LibreWolf"
  desc "Web browser"
  homepage "https://librewolf.net/"

  livecheck do
    url "https://gitlab.com/api/v4/projects/44042130/releases"
    regex(/librewolf[._-]v?(\d+(?:\.\d+)+(?:-\d+)?)[._-]macos[._-]arm64/i)
    strategy :json do |json, regex|
      json.map do |release|
        asset = release["assets"]["links"].find { |l| l["name"]&.match?(regex) }
        asset["name"][regex, 1] if asset
      end
    end
  end

  app "LibreWolf.app"

  zap trash: [
    "~/Library/Application Support/LibreWolf",
    "~/Library/Caches/LibreWolf",
    "~/Library/Preferences/io.gitlab.librewolf-community.librewolf.plist",
  ]
end

