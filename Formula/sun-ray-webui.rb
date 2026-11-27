class SunRayWebui < Formula
  desc "Xray-core proxy client with an embedded browser UI (Linux)"
  homepage "https://github.com/idealisan/sun-ray/"
  version "0.20.21"

  on_macos do
    # Upstream only builds the web UI variant for Linux. This URL keeps the
    # formula loadable on all systems; the installed helper explains that.
    url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-darwin-arm64.zip"
    sha256 "987ad9642883992f27ed3143533ed83e786c7f1e5231696dacda90d2facfdbb9"
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-webui-linux-arm64"
      sha256 "54e32109d284ad4d7bffa413bb638101d619510e5d6c320e59805e659000de7f"
    end

    on_intel do
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-webui-linux-amd64"
      sha256 "0c33ad0caa47f607608d0d11ae96e9b13199bd80ec4c5cb91d63aad484d94dd3"
    end
  end

  def install
    on_macos do
      (bin/"sun-ray-webui").write <<~SH
        #!/bin/sh
        echo "sun-ray-webui is Linux-only. On macOS use: brew install --cask sun-ray" >&2
        exit 1
      SH
      chmod 0755, bin/"sun-ray-webui"
    end

    on_linux do
      cp cached_download, bin/"sun-ray-webui"
      chmod 0755, bin/"sun-ray-webui"
    end
  end

  def caveats
    "Run with: sun-ray-webui -config /etc/sunray.json, then open http://127.0.0.1:3785"
  end

  test do
    on_linux do
      assert_match version.to_s, shell_output("#{bin}/sun-ray-webui -version")
    end
  end
end
