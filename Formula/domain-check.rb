class DomainCheck < Formula
    desc "Fast, powerful CLI tool for checking domain availability using RDAP and WHOIS"
    homepage "https://github.com/saidutt46/domain-check"
    version "0.5.0"  # Update this to your current version
    license "Apache-2.0"
  
    if Hardware::CPU.arm?
      url "https://github.com/saidutt46/domain-check/releases/download/v0.5.0/domain-check-macos-aarch64.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_SHA256"  # Will be updated automatically
    else
      url "https://github.com/saidutt46/domain-check/releases/download/v0.5.0/domain-check-macos-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"   # Will be updated automatically  
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