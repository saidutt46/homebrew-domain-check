class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.5.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.5.1/domain-check-macos-aarch64.tar.gz"
    sha256 "db60d0ea2c6ee61e8aa15379e8d2f5ea8272cbe1829667c3a9bc63c92179083c"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.5.1/domain-check-macos-x86_64.tar.gz"
    sha256 "28dc5bb163e824faf442e06ef08dacfcb5b2844bdb04a5bad8ef60eac9613085"
  end

  def install
    bin.install "domain-check"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domain-check --version")
    # Test basic functionality
    assert_match "TAKEN", shell_output("#{bin}/domain-check google.com")
  end
end
