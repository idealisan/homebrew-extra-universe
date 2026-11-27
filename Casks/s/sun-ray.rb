cask "sun-ray" do
  version "0.20.21"
  sha256 "d677b01db9abb22f7dbf2933bb773f0053bf6349f1a9213b015f66edbba9cdac"

  url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-#{version}-arm64.dmg",
      verified: "github.com/idealisan/sun-ray/"
  name "Sun Ray"
  desc "GUI client for Xray-core with an embedded proxy core"
  homepage "https://github.com/idealisan/sun-ray/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The release only ships an arm64 disk image (the build workflow builds
  # darwin/arm64 exclusively); Intel Macs need an arm64 build added upstream.
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Sun Ray.app"

  zap trash: [
    "~/Library/Application Support/com.idealisan.sunray",
    "~/Library/Preferences/com.idealisan.sunray.plist",
    "~/Library/Saved Application State/com.idealisan.sunray.savedState",
  ]
end
