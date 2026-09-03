class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.7.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.1/dk-aarch64-apple-darwin.tar.gz"
      sha256 "5a2afe28f459baf05763ca716344958921a4e162ca91bd4f7e535da51627b01f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.1/dk-x86_64-apple-darwin.tar.gz"
      sha256 "5f0ec87c7bd943a092b5bc5f595c551696f957eb3ff00584ee4516bf646854e9"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dakera-ai/dakera-cli/releases/download/v0.7.1/dk-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3d2ecea2445911e2bcdd141e5d8b42046f636e17eae3936654b919a21db8e886"
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
