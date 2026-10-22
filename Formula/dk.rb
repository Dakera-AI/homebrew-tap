class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.8.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.2/dakera-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8c5197cd98735cd695b7811e9a1701f1a862f1efdb21d7eed43fb0f82172eca8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.2/dakera-cli-x86_64-apple-darwin.tar.gz"
      sha256 "bb8e995202a57ed0ce0548d50f1560a8a1a919fb66082792064a1d5e321c93b7"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.2/dakera-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6d82db1e3676384b7aa41894479a38f8a03c7f5114f965030f8d7c6c71fb5883"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dk"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "dk"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "dk"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
