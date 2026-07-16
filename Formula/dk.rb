class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.0/dakera-cli-aarch64-apple-darwin.tar.xz"
      sha256 "b9808304bee99670923d893daa5868a34e58145428bebe8f0ea77b6198d0f272"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.0/dakera-cli-x86_64-apple-darwin.tar.xz"
      sha256 "088f1339e165603711e75caee5c32da8b587777b69dec07ed1e22ee64a5398cd"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.0/dakera-cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "aae934e50704dd935496a7ee7c2e3d689d4ef8b42166343605e9a2e982a95d1b"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "dk" if OS.mac? && Hardware::CPU.arm?
    bin.install "dk" if OS.mac? && Hardware::CPU.intel?
    bin.install "dk" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
