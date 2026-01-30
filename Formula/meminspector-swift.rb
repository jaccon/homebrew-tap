class MeminspectorSwift < Formula
  desc "Memory Inspector for macOS - Native Swift implementation with zero dependencies"
  homepage "https://github.com/jaccon/meminspector"
  url "https://github.com/jaccon/meminspector/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0061d3a34a9b5ff551412c3fcce907fa46055bd43dff80d1349c400eca42a12a"
  license "MIT"
  head "https://github.com/jaccon/meminspector.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    cd "swift-version" do
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/MemInspector" => "meminspector"
    end
  end

  test do
    system "#{bin}/meminspector", "--help"
  end
end
