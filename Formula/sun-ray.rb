class SunRay < Formula
  desc "Xray-core proxy client with a native GUI (Linux desktop build)"
  homepage "https://github.com/idealisan/sun-ray/"
  version "0.20.21"

  on_macos do
    # The macOS release is a GUI .app; the `sun-ray` cask installs it into
    # /Applications. This URL keeps the formula loadable on all systems.
    url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-darwin-arm64.zip"
    sha256 "987ad9642883992f27ed3143533ed83e786c7f1e5231696dacda90d2facfdbb9"
  end

  on_linux do
    on_intel do
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-linux-amd64"
      sha256 "c1645fbc6d5b11c42b40d0fda68dfa3943221520d060edc5b9a86521859c7b54"
    end

    on_arm do
      # Upstream ships no native GUI binary for linux/arm64; the web UI build
      # is the closest desktop experience there.
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-webui-linux-arm64"
      sha256 "54e32109d284ad4d7bffa413bb638101d619510e5d6c320e59805e659000de7f"
    end
  end

  def install
    on_macos do
      prefix.install Dir["Sun Ray.app"]
      (bin/"sun-ray").write <<~SH
        #!/bin/sh
        exec open "#{prefix}/Sun Ray.app" "$@"
      SH
      chmod 0755, bin/"sun-ray"
    end

    on_linux do
      cp cached_download, bin/"sun-ray"
      chmod 0755, bin/"sun-ray"
    end
  end

  def caveats
    return unless OS.linux? && Hardware::CPU.arm?

    "Upstream has no native GUI binary for linux/arm64; the web UI build was installed as `sun-ray` (default: http://127.0.0.1:3785)."
  end

  test do
    on_linux do
      assert_match version.to_s, shell_output("#{bin}/sun-ray -version")
    end
  end
end
