class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "1.0.1"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-aarch64.tar.gz"
    sha256 "395388084c218d43fd700aaf377f7c7877f868df35084d4026077d422049ddde"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-x86_64.tar.gz"
    sha256 "aa32959a7f68a762a098436976e0aa9326088aa0b2e10edc964f7fc5c7c11352"
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
