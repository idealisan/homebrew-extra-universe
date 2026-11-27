cask "userpref-mcp" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "84499ce82e5ea938012324a1dd56bca58d5f129a0a3fe3823e162f63378b59e1",
         intel: "2ac384e03ad13f38a98b9a083f866e5ec2a6c72982ce4ce1e11374127f985680"

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
