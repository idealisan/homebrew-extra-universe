class ZuluAT11 < Formula
  desc "Azul Zulu Java Standard Edition Development Kit (JDK 11)"
  homepage "https://www.azul.com/products/core/"
  url "https://cdn.azul.com/zulu/bin/zulu11.80.21-ca-jdk11.0.27-macosx_x64.zip"
  sha256 "7f680681920674ffdd7eefe8d71f747f71a9eccd4884efca1005d0dd102e18bb"
  license "GPL-2.0-only"

  def install
    jdk = "zulu-11.jdk"
    libexec.install Dir["zulu11.80.21-ca-jdk11.0.27-macosx_x64/*"]
    bin.install_symlink Dir[libexec/"bin/*"]
    include.install_symlink Dir[libexec/"include/*"]
    man1.install_symlink Dir[libexec/"man/man1/*"]
  end

  def caveats
    <<~EOS
      To use this JDK, you may need to set JAVA_HOME:
        export JAVA_HOME=#{opt_libexec}/zulu-11.jdk/Contents/Home
    EOS
  end

  test do
    system bin/"java", "-version"
  end
end