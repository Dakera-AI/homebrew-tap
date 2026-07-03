class DakeraMcp < Formula
  desc "Dakera MCP Server - Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.10.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "5da1143ca3e9676ed6d9e7e62219da6ed088844bf8b1c405f5b8ebdb94ba6c94"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "1f963597c2d1bae72aa14b1d407ca36649d6d20e4fbe9529c54f7747b521afe5"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d74102a17bff69754b6f1ed6e0175a43acaacaa8f92ee4438a915ec6046548ee"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
