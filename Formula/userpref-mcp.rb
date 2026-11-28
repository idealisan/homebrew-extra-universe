class UserprefMcp < Formula
  desc "MCP server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_arm64"
      sha256 "1c6a14695a1903d256d4637da9ccffcb3ebb0aa629208168875851d406af8b54"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_amd64"
      sha256 "a13ea822bfd5530e79769d1d168da7c32d0480bbab93d5b6b5819b0a198df921"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_arm64"
      sha256 "4864a11186a41bff0e423e0214c1f5d5be4cedf063c17a1c0612d0191c0507a3"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_amd64"
      sha256 "12061450dcefbb045e786df9297751bd612b7a6a1387f7c9b5064a5fa5b9ef8e"
    end
  end

  def install
    bin.install cached_download => "userpref-mcp"
    chmod 0755, bin/"userpref-mcp"
  end

  # `brew services start userpref-mcp` registers the HTTP server with launchd
  # (macOS) or systemd (Linux) so it starts at login/boot.
  # MCP endpoint: http://127.0.0.1:8765/mcp
  service do
    run [opt_bin/"userpref-mcp", "--host", "127.0.0.1", "--port", "8765"]
    keep_alive true
    run_at_load true
    log_path var/"log/userpref-mcp.log"
    error_log_path var/"log/userpref-mcp.error.log"
  end

  test do
    assert_match "Usage of", shell_output("#{bin}/userpref-mcp --help 2>&1")
  end
end
