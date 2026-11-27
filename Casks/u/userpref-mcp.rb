cask "userpref-mcp" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "c31be614e69f99b29e48416bed65b074312844268c7247ae539672af79c9ce2f",
         intel: "af4d624fc82573f908da66229c2909e3251dae147ab3a3f7fa5b92074fe8b6"

  url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_#{arch}",
      verified: "github.com/idealisan/user-preferences-mcp/"
  name "UserPref MCP Server"
  desc "MCP server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "userpref-mcp_#{arch}", target: "userpref-mcp"

  depends_on :macos

  caveats <<~EOS
    Homebrew's `brew services` auto-start support is provided by the formula
    of the same name. To run the MCP server at login/boot, use:

      brew install #{token}
      brew services start #{token}

    MCP endpoint: http://127.0.0.1:8765/mcp
  EOS
end
