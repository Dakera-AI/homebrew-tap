class Dk < Formula
  desc "Command-line interface for Dakera AI Agent Memory Platform"
  homepage "https://dakera.ai"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-aarch64-apple-darwin.tar.gz"
      sha256 "31f6f1259d96be22c79905a828a8e66fca8735a17b1b7ded69e1b345fc08d603"
    else
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-x86_64-apple-darwin.tar.gz"
      sha256 "6bd43fa0d4fe297e26431e8a8356d7800db6eb2701137567f319b240d57f86ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Dakera-AI/dakera-cli/releases/download/v0.6.0/dk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83960a8c4e946b0fbd687861b3d7bec5b01f9c0525a07292d11c8975445661de"
    end
  end

  def install
    bin.install "dk"
  end

  test do
    system "#{bin}/dk", "--version"
  end
end
