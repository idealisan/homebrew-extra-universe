class UserprefMcp < Formula
  desc "MCP server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_arm64"
      sha256 "84499ce82e5ea938012324a1dd56bca58d5f129a0a3fe3823e162f63378b59e1"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_amd64"
      sha256 "2ac384e03ad13f38a98b9a083f866e5ec2a6c72982ce4ce1e11374127f985680"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_arm64"
      sha256 "bfce7f7228a3eb0ef22bad1e49af361fa315c4481d67f8f90a460e7ec75fca55"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_amd64"
      sha256 "134eb4171936610321679e896701f69f32907a7e5d4b2837a4f8f1767d572976"
    end
  end

  def install
    cp cached_download, bin/"userpref-mcp"
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
