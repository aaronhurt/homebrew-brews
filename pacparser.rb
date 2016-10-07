class Pacparser < Formula
  desc "Library to parse proxy auto-config (PAC) files"
  homepage "https://github.com/pacparser/pacparser"
  url "https://github.com/pacparser/pacparser/archive/1.3.6.tar.gz"
  sha256 "c1f6f2ccd4fec329175f882102e47c57328e8e6e16aa9dbd4f8b859f9a028e83"
  head "https://github.com/pacparser/pacparser.git"

  depends_on "python" => :optional

  def install
    ENV.deparallelize
    cd "src" do
      system "make"
      system "make", "install", "PREFIX=#{prefix}"
    end
    if build.with? "python"
      cd "src" do
        system "make", "pymod"
        system "make", "install-pymod", "PREFIX=#{prefix}"
      end
    end
  end

  test do
    ## todo
  end
end
