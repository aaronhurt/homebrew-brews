class Pacparser < Formula
  desc "Library to parse proxy auto-config (PAC) files"
  homepage "https://github.com/pacparser/pacparser"
  url "https://github.com/pacparser/pacparser/archive/1.3.6.tar.gz"
  sha256 "c1f6f2ccd4fec329175f882102e47c57328e8e6e16aa9dbd4f8b859f9a028e83"
  head "https://github.com/pacparser/pacparser.git"

  depends_on "python" => :optional

  def install
    system "make", "-j1", "-C", "src", "install",
           "PREFIX=#{prefix}", "VERSION=#{version}"

    if build.with? "python"
      system "make", "-j1", "-C", "src", "install-pymod",
             "EXTRA_ARGS=\"--prefix=#{prefix}\"",
             "VERSION=#{version}"
    end
  end

  test do
    ## functional tests are run as part of the make
    assert_equal version.to_s, shell_output("#{bin}/pactester -v").strip
  end
end
