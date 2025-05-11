cask "stash-nsfw" do
  version "0.28.1"
  sha256 :no_check

  url "https://github.com/stashapp/stash/releases/download/v#{version}/stash-macos"
  name "Stash-NSFW"
  desc "Web-based media collection organizer, written in Go"
  homepage "https://github.com/stashapp/stash"

  depends_on macos: ">= :sierra"
  depends_on formula: "ffmpeg"

  binary "stash-macos", target: "stash-nsfw"
  service do
    run [opt_bin/"stash-nsfw", "--config", "#{Dir.home}/.stash/config.yml"]
    keep_alive true
    working_dir Dir.home
    log_path var/"log/stash-nsfw.log"
    error_log_path var/"log/stash-nsfw.err"
  end

  postflight do
    system_command "chmod", args: ["+x", "#{staged_path}/stash-macos"]
  end

  zap trash: [
    "#{var}/log/stash-nsfw.err",
    "#{var}/log/stash-nsfw.log",
    "~/.stash",
    "~/Library/Application Support/Stash",
  ]

  caveats <<~EOS
    To remove Stash-NSFW configuration files and logs after uninstalling, run:
      brew zap stash-nsfw
  EOS
end
