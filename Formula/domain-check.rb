class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "1.0.0"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.0/domain-check-macos-aarch64.tar.gz"
    sha256 "1dd4a4a4eb772b7f08dc9b5ede9de6fce3c3d42e159dd01e971e7b713d5cd142"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.0/domain-check-macos-x86_64.tar.gz"
    sha256 "59cb8814ef0d470270d1c3999221f0b1c5ddda43417bde56bdff550f863c5edf"
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
