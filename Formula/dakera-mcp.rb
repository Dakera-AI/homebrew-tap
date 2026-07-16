class DakeraMcp < Formula
  desc "Dakera MCP Server - Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.10.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "9b2e1ec5ac1cc6106a8fb4a7010a41bd6d1e54ec96a5336abebecc13610714da"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "7e64e931de6e955c0bb363676a2c67d0f95cb4d8f3f1ea143c7bbfe0cd8dc1bf"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "669e6fab2a975b292ecea34b61f5eea7f56674314400c64bc85b9624db32082a"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
