cask "userpref-mcp-stdio" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "9763d0aae7e4809140fc5796b342e52de8f6c370abd9001fd18246904469f16a",
         intel: "cd0a4ed1a55cf7e524e80c335b306650a66a7030ee3494bb77c92047d403a83e"

  url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp-stdio_darwin_#{arch}",
      verified: "github.com/idealisan/user-preferences-mcp/"
  name "UserPref MCP Server (stdio)"
  desc "MCP stdio server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "userpref-mcp-stdio_#{arch}", target: "userpref-mcp-stdio"

  depends_on :macos

  caveats <<~EOS
    This is the stdio variant: your MCP client launches it and speaks MCP over
    stdin/stdout, so no background service is needed. Point the client at:

      $(brew --prefix)/bin/userpref-mcp-stdio

    Supported flags: --db, --profile, --user-id, --log-level.
    For the HTTP server variant, install `userpref-mcp` instead.
  EOS
end
