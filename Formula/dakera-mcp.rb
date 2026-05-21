class DakeraMcp < Formula
  desc "Dakera MCP Server - Model Context Protocol server for AI agent memory"
  homepage "https://dakera.ai"
  version "0.10.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "386379790bf3437458205fcb717a633cb76ba3a60a55ba6582393568c7463085"
    else
      url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "7c2054b445a59a11edf107a8a82d114be213c2f3e380ed13847453194886ebc4"
    end
  end

  on_linux do
    url "https://github.com/dakera-ai/dakera-mcp/releases/download/v#{version}/dakera-mcp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7cc5d5a519297b8d61885caa69ecdc4c7e3e2b50a87f5d7fce2a06dd780c1fa3"
  end

  def install
    bin.install "dakera-mcp"
  end

  test do
    system "#{bin}/dakera-mcp", "--version"
  end
end
