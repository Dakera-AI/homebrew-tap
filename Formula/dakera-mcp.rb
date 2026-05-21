# Auto-updated by .github/workflows/update-homebrew-formula.yml in dakera-mcp repo.
# SHA256 checksums are regenerated on each release — do not edit manually.

class DakeraMcp < Formula
  desc "Dakera MCP Server — Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.10.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_aarch64_apple_darwin"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_x86_64_apple_darwin"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "PLACEHOLDER_x86_64_unknown_linux_gnu"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
