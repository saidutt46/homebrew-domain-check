class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.9.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.9.1/domain-check-macos-aarch64.tar.gz"
    sha256 "8bcb4d9dfb8686b3ed4789f10a826dd6bef02eaa4e790a4accb014db4e870bdf"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.9.1/domain-check-macos-x86_64.tar.gz"
    sha256 "cc49fff230582ca8d8b14280064ca49b33494b7b38241ed1c9e4b16db0bfef54"
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
