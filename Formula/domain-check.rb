class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "1.0.2"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.2/domain-check-macos-aarch64.tar.gz"
    sha256 "1b0deab82dad5718b9765eaeed990b6418a1e666350b2f6c6e1663904299fe6e"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.2/domain-check-macos-x86_64.tar.gz"
    sha256 "ad3231e062c105ef77c480bd7bad2a81dd026f646be030ca0551db47de314417"
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
