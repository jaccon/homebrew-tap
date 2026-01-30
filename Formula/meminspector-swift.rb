class MeminspectorSwift < Formula
  desc "Memory Inspector for macOS - Native Swift implementation with zero dependencies"
  homepage "https://github.com/jaccon/meminspector"
  url "https://github.com/jaccon/meminspector/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0061d3a34a9b5ff551412c3fcce907fa46055bd43dff80d1349c400eca42a12a"
  license "MIT"
  head "https://github.com/jaccon/meminspector.git", branch: "main"

  depends_on :macos

  # Try to build with Swift if available, otherwise provide instructions
  def install
    cd "swift-version" do
      if system("which swift > /dev/null 2>&1")
        system "swift", "build", "-c", "release"
        bin.install ".build/release/MemInspector" => "meminspector"
      else
        odie "Swift compiler not found. Please install Xcode Command Line Tools or build manually."
      end
    end
  end

  def caveats
    <<~EOS
      MemInspector Swift Native Version installed successfully!
      
      This is a native macOS binary with zero dependencies.
      Binary size: ~93KB | Startup time: ~10ms
      
      Usage:
        meminspector --tui       # Colored terminal interface
        meminspector --refresh   # Continuous refresh mode
        meminspector --graph     # ASCII graphs
        meminspector --help      # Show all options
      
      For the Python version with matplotlib support:
        brew install jaccon/tap/meminspector
    EOS
  end

  test do
    system "#{bin}/meminspector", "--help"
  end
end
