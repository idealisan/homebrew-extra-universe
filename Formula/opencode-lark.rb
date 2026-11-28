class OpencodeLark < Formula
  desc "Feishu/Lark bridge for local OpenCode sessions"
  homepage "https://github.com/idealisan/opencode-lark"
  version "0.5.1"

  # Our fork adds OpenCode v2 Basic auth, Lark international domain support,
  # and local-timezone log timestamps. Pinned to the v0.5.1 release commit.
  url "https://github.com/idealisan/opencode-lark/archive/869eec74c4b333dc070e6f38889ca468e3eddb5c.tar.gz"
  sha256 "db9c5f6d621fb0f999fd286d2682c7814e5f52937bb895178740e4f1a69b89cd"

  depends_on "bun"

  def install
    libexec.install Dir["*"]

    cd libexec do
      system Formula["bun"].opt_bin/"bun", "install", "--frozen-lockfile"
    end

    # Run from $HOME so the existing ./data directory and the config under
    # ~/.config/opencode-lark are used.
    (bin/"opencode-lark").write <<~SH
      #!/bin/sh
      cd "$HOME" || exit 1
      exec "#{Formula["bun"].opt_bin}/bun" run "#{libexec}/src/index.ts" "$@"
    SH
    chmod 0755, bin/"opencode-lark"

    (var/"opencode-lark").mkpath
  end

  # `brew services start opencode-lark` registers a launchd agent on macOS
  # (systemd unit on Linux) and starts the bridge at login/boot.
  service do
    run [opt_bin/"opencode-lark"]
    keep_alive true
    run_at_load true
    working_dir var/"opencode-lark"
    log_path var/"log/opencode-lark.log"
    error_log_path var/"log/opencode-lark.error.log"
    # The server supervisor may need to launch `opencode serve` on demand.
    environment_variables PATH: "#{ENV["HOME"]}/.opencode/bin:#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  end

  test do
    assert_predicate bin/"opencode-lark", :executable?
    system Formula["bun"].opt_bin/"bun", "build", libexec/"src/index.ts",
           "--target=bun", "--outdir", testpath
  end
end
