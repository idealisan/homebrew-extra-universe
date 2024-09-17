cask "airy-ai" do
  arch arm: "arm64", intel: "64"

  version "1.1.1"
  sha256 arm:   "95986d845466153e541b2d09bf8025fa8c612771b7b47e8a70c74c6b080d1416",
         intel: "5633656e9e78fe5590563ce59132320ef228708843f7ac368dd470f535acb8fb"

  url "https://electron-release-cdn.codefuture.top/download/flavor/Airy/latest/osx_#{arch}",
      verified: "electron-release-cdn.codefuture.top/"
  name "Airy"
  desc "Search Launcher Powered by AI"
  homepage "https://colink.in/"

  livecheck do
    url :url
    regex(/Airy-v([^-]+)-mac/i)
    strategy :header_match
  end

  app "Airy.app"

  zap trash: [
    "~/Library/Application Support/airy",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.aloha.airy.sfl3",
    "~/Library/Logs/airy",
    "~/Library/Preferences/com.aloha.airy.plist",
    "~/Library/Saved Application State/com.aloha.airy.savedState",
  ]
end
