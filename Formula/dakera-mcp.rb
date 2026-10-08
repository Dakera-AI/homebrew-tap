class DakeraMcp < Formula
  desc "Dakera MCP Server - Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "05c18e46f44060291abe020bdb9f3b0d79605bfce7323ef49e7ec52c8a875504"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "345ea0e52ecfe475e7f1fa26f3e6171b844a3981d31069aa2bdde52647c1b4e2"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b35e7ccb59e89dec612d69dd4d90b2918b8b5ec034af8e2a7eaea8375559d0b4"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
