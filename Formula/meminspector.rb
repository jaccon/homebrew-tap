class Meminspector < Formula
  include Language::Python::Virtualenv

  desc "Memory Inspector for macOS - Analyze memory consumption of applications and threads with Docker support"
  homepage "https://github.com/jaccon/meminspector"
  url "https://github.com/jaccon/meminspector/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "3a20b500e4559454451520f891a1c48ae2fd7b0eca19c687b91cb2f222543861"
  license "MIT"
  head "https://github.com/jaccon/meminspector.git", branch: "main"

  depends_on "python@3.11"

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/26/10/2a30b13c61e7cf937f4adf90710776b7918ed0a9c434e2c38224732af310/psutil-6.1.0.tar.gz"
    sha256 "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "docker" do
    url "https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce/docker-7.1.0.tar.gz"
    sha256 "ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/meminspector", "--help"
  end
end
