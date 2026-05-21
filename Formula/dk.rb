# This formula is automatically maintained by cargo-dist.
# Do not edit manually — it will be overwritten on each release.
# Source: https://github.com/dakera-ai/dakera-cli

class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CARGO_DIST"
    else
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CARGO_DIST"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CARGO_DIST"
    end
  end

  def install
    bin.install "dk"
  end

  test do
    system "#{bin}/dk", "--version"
  end
end
