class Discogs < Formula
  include Language::Python::Virtualenv

  desc "Discogs Data Processor CLI"
  homepage "https://github.com/ofurkancoban/DiscogsCLI"
  url "https://github.com/ofurkancoban/DiscogsCLI/archive/refs/tags/v1.5.8.tar.gz"
  sha256 "d05345489682bcf87b8904fc0502156d9454a642a2fbec7ad8c0c9f20771854c"
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
