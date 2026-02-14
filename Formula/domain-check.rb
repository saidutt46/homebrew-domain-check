class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "0.8.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v0.8.0/domain-check-macos-aarch64.tar.gz"
    sha256 "06f9e91acbf03482b392fa1ebdeeccba811f13ca6aa25cd306687eb27e377224"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v0.8.0/domain-check-macos-x86_64.tar.gz"
    sha256 "9492373ede4c3dfb168f6ff2eac9884bd650e81133852a5581048bd189e12ca5"
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
