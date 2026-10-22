class DakeraMcp < Formula
  desc "Dakera MCP Server - Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "9f3ba365cce5216b8bad1c695640daec38f28808354794e5d5971b33b5a6ca4a"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "cfa4412fd92efa04e9bae89cebd35cd3b23b50f07b779d0d64da0e1d629777e7"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b9f951d9ba35276946179b992430dcb98d25ca2d1eb3d41aff652a10286f217c"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
