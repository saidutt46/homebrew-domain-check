class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.9.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.9.0/domain-check-macos-aarch64.tar.gz"
    sha256 "a382f17b47095b7d04f2d7a47cd90638f220a2edc059201c1552190700de477b"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.9.0/domain-check-macos-x86_64.tar.gz"
    sha256 "46cfbcc950966c8bcc7631beaf78ab42da7a23adf08b9f60c47059bc6d8402b5"
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
