class UserprefMcpStdio < Formula
  desc "MCP stdio server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp-stdio_darwin_arm64"
      sha256 "9763d0aae7e4809140fc5796b342e52de8f6c370abd9001fd18246904469f16a"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp-stdio_darwin_amd64"
      sha256 "cd0a4ed1a55cf7e524e80c335b306650a66a7030ee3494bb77c92047d403a83e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp-stdio_linux_arm64"
      sha256 "2b3e220a171da563ce6a4d8582aa5b5679a3382e76a3a990ad65c314a034598e"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp-stdio_linux_amd64"
      sha256 "c1ab31538e6d600564b4ee41c78de15c49a5ff88114019ae7d4091ae1d694ec1"
    end
  end

  def install
    cp cached_download, bin/"userpref-mcp-stdio"
    chmod 0755, bin/"userpref-mcp-stdio"
  end

  # Unlike userpref-mcp, this variant has no HTTP listener and no service:
  # the MCP client starts the process and talks to it over stdin/stdout.
  def caveats
    "Configure your MCP client with the absolute path: #{opt_bin}/userpref-mcp-stdio"
  end

  test do
    assert_match "Usage of", shell_output("#{bin}/userpref-mcp-stdio --help 2>&1")
  end
end
