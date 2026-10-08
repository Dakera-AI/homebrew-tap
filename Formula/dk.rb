class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.8.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.1/dakera-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d38eb3b20c4c969f6f1158dbdb8b00b27256ad59c9cafd4220a0ea84e7611e99"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.1/dakera-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ad0434be5fa05906fb081ee95df98f4d2a8ac1652cc8ba5bc39e91bd5d16fb96"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.8.1/dakera-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4f348c8da7c8d9bdef8a19d53bab51274c368fcbb4b5f6640f79f03c430b96f1"
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
