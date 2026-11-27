cask "userpref-mcp" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "1c6a14695a1903d256d4637da9ccffcb3ebb0aa629208168875851d406af8b54",
         intel: "a13ea822bfd5530e79769d1d168da7c32d0480bbab93d5b6b5819b0a198df921"

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
