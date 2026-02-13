class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.7.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.7.0/domain-check-macos-aarch64.tar.gz"
    sha256 "1f3bbe4d7598737c0d8bdb20d43f192cc8e8b7b8bbd9cfc2e279699013f3cad6"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.7.0/domain-check-macos-x86_64.tar.gz"
    sha256 "68ffb3dbf0ad2dbd27477cf25eee2b8c4551a7885139aee84b58cfb7c2c1d5d8"
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
