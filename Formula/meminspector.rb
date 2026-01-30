class Meminspector < Formula
  include Language::Python::Virtualenv

  desc "Memory Inspector for macOS - Analyze memory consumption of applications and threads with Docker support"
  homepage "https://github.com/jaccon/meminspector"
  url "https://github.com/jaccon/meminspector/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d8f5c9b7f2c3445444a3447301d8da316b59a806303ddf74bbd7ff59cf0d2f42"
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

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/68/dd/fa2e1a45fce2d09f4aea3cee169760e672c8262325aa5796c49d543dc7e6/matplotlib-3.10.0.tar.gz"
    sha256 "b886d02a581b96704c9d1ffe55709e49b4d2d52709ccebc4be42db856e511278"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "docker" do
    url "https://files.pythonhosted.org/packages/e1/80/b4d10f00c26fd4f1a26ab43f9bcb0c87e3f51cef1b7ee8e2c43bb5e1ae33/docker-7.1.0.tar.gz"
    sha256 "ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/meminspector", "--help"
  end
end
