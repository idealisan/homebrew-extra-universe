class SunRayNogui < Formula
  desc "Headless Xray-core proxy client (Linux servers, no user interface)"
  homepage "https://github.com/idealisan/sun-ray/"
  version "0.20.21"

  on_macos do
    # Upstream only builds the headless variant for Linux. This URL keeps the
    # formula loadable on all systems; the installed helper explains that.
    url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-darwin-arm64.zip"
    sha256 "987ad9642883992f27ed3143533ed83e786c7f1e5231696dacda90d2facfdbb9"
  end

  on_linux do
    on_arm do
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-nogui-linux-arm64"
      sha256 "5621f0efe9ff77f5b777a991ee4efec15e64748bf4c346ffdb40c93f83ecf354"
    end

    on_intel do
      url "https://github.com/idealisan/sun-ray/releases/download/v#{version}/sun-ray-nogui-linux-amd64"
      sha256 "39b404942e2e4d6e709d943bba60bcdcc23f5201cad718ddc6a2c6625aece873"
    end
  end

  def install
    on_macos do
      (bin/"sun-ray-nogui").write <<~SH
        #!/bin/sh
        echo "sun-ray-nogui is Linux-only. On macOS use: brew install --cask sun-ray" >&2
        exit 1
      SH
      chmod 0755, bin/"sun-ray-nogui"
    end

    on_linux do
      # Reads the same sunray.json as the GUI build; logs go to stdout.
      cp cached_download, bin/"sun-ray-nogui"
      chmod 0755, bin/"sun-ray-nogui"
    end
  end

  def caveats
    "Run with: sun-ray-nogui -config /etc/sunray.json"
  end

  test do
    on_linux do
      assert_match version.to_s, shell_output("#{bin}/sun-ray-nogui -version")
    end
  end
end
