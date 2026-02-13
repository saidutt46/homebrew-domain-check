class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.6.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.6.1/domain-check-macos-aarch64.tar.gz"
    sha256 "cc61ac91dc797bba0b9361a494986aaeb6cf3d0537b57fcdfab83ff46f4cc820"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.6.1/domain-check-macos-x86_64.tar.gz"
    sha256 "060ff887eea985da2991eedc1ff74644d096f1c21e3c6570c3f79f110a3b7608"
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
