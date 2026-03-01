class DomainCheck < Formula
  desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
  homepage "https://github.com/saidutt46/domain-check"
  version "1.0.1"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-aarch64.tar.gz"
    sha256 "68af64ed7455602274ebec8c7d58aa282f58634bb672fcbafcec96d591121237"
  else
    url "https://github.com/saidutt46/domain-check/releases/download/v1.0.1/domain-check-macos-x86_64.tar.gz"
    sha256 "eeb7168dca0234b8d1dbfab6c9d792867da5de7004da0757b0f9de8090bbf9c1"
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
