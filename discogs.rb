class Discogs < Formula
  include Language::Python::Virtualenv

  desc "Discogs Data Processor CLI"
  homepage "https://github.com/ofurkancoban/DiscogsCLI"
  url "https://github.com/ofurkancoban/DiscogsCLI/archive/refs/tags/v1.5.9.tar.gz"
  sha256 "f19fd8e4905ea591224001af573e28b0bb8ea2d75db9915f69b272ab502eb242"
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
