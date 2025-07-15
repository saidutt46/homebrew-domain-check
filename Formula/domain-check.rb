class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.6.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.6.0/domain-check-macos-aarch64.tar.gz"
    sha256 "bcd20c96a50612a3af82d6f63ab40cff48bb71b70843f0f30049367f18a164fd"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.6.0/domain-check-macos-x86_64.tar.gz"
    sha256 "3471d6e6af6078d46ca1d9b36116303d111a663fb4c9ca8c885962ce4d6c8b68"
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
