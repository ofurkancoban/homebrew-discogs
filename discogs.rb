class Discogs < Formula
  include Language::Python::Virtualenv

  desc "Discogs Data Processor CLI"
  homepage "https://github.com/ofurkancoban/DiscogsCLI"
  url "https://github.com/ofurkancoban/DiscogsCLI/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "329954f986699dc909e7670f4c2aef015cb29b9d165d60a9bd0299bf09866e2d"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = libexec
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", venv
    system venv/"bin/pip", "install", "."
    bin.install_symlink venv/"bin/discogs"
  end

  test do
    assert_match "Discogs CLI", shell_output("#{bin}/discogs --help")
  end
end
