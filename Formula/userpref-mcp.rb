class UserprefMcp < Formula
  desc "MCP server providing a shared user preference store for AI agents"
  homepage "https://github.com/idealisan/user-preferences-mcp"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_arm64"
      sha256 "c31be614e69f99b29e48416bed65b074312844268c7247ae539672af79c9ce2f"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_darwin_amd64"
      sha256 "af4d624fc82573f908da66229c2909e3251dae147ab3a3f7fa5b92074fe8b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_arm64"
      sha256 "ecb7093fe011244e90334b0452a6f25a5f9ebcfb0f802739a3b1b6989cba04fb"
    end

    on_intel do
      url "https://github.com/idealisan/user-preferences-mcp/releases/download/v#{version}/userpref-mcp_linux_amd64"
      sha256 "f246a5f7723351bd954e2cf6c40bb366adfd33cdb5b1d2c25017599ad59ee908"
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
