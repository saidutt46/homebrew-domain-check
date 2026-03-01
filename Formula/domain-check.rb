class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "1.0.1"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-aarch64.tar.gz"
    sha256 "533e2321338f8d7d81f23671de11cf51140f976ad0e2beb1d0b4a0342fa9e32f"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-x86_64.tar.gz"
    sha256 "7b548c2827991801743b242fd7039637c3247b87a0bee0e047123c3bd81244fc"
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
