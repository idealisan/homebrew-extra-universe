cask "peazip" do
  version "9.9.1"
  sha256 "82a3a7f1eba405f032c0a08d5e60a83c019bf8624fdd03020f75f4882de91bfe"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.aarch64.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "Peazip"
  desc "Free Zip/Unzip software and Rar file extractor"
  homepage "https://peazip.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "PeaZip.app"

  postflight do
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, add to archive.workflow"]
    system_command "/usr/bin/open",
                   args: ["#{staged_path}/macOS service menus/PeaZip, extract here (smart new folder).workflow"]
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, extract....workflow"]
    system_command "/usr/bin/open", args: ["#{staged_path}/macOS service menus/PeaZip, open file or folder.workflow"]
  end

  zap trash: [
    "~/.config/peazip",
    "~/Library/Preferences/com.company.peazip.plist",
    "~/Library/Saved Application State/com.company.peazip.savedState",
  ]
end
