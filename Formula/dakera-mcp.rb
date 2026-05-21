# Manually maintained formula for dakera-mcp server.
# cargo-dist does NOT manage this formula (dakera-mcp uses Docker for releases).
# Update URLs and SHA256 checksums manually after each server release.
# Phase: 3b (see DAK-5410 for npx wrapper implementation)

class DakeraMcp < Formula
  desc "Dakera AI Memory MCP server — plug into any MCP-compatible AI client"
  homepage "https://dakera.ai"
  version "0.11.54"
  # TODO(DAK-5410): add binary URLs once cross-compilation is complete (DAK-5409)
  # For now, installation requires Docker: docker run -p 3300:3300 ghcr.io/dakera-ai/dakera:latest
  depends_on "docker" => :optional

  def install
    # Placeholder until DAK-5409 (cross-compile) is complete
    odie "dakera-mcp binary distribution not yet available. Use Docker or npx @dakera-ai/dakera-mcp (coming DAK-5410)."
  end

  test do
    true
  end
end
