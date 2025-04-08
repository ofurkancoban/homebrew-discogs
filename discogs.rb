class Discogs < Formula
  include Language::Python::Virtualenv

  desc "Discogs Data Processor CLI"
  homepage "https://github.com/ofurkancoban/DiscogsCLI"
  url "https://github.com/ofurkancoban/DiscogsCLI/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "97d707d15e42b33acfe90f4584b2d07895dce9f97b209dddb650e22a1671bdcd"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "venv", "venv"
    system "./venv/bin/pip", "install", "."


    bin.install_symlink buildpath/"venv/bin/discogs"
  end

  test do
    assert_match "Discogs CLI", shell_output("#{bin}/discogs --help")
  end
end
