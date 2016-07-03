class Pacparser < Formula
  homepage "https://github.com/pacparser/pacparser"
  url "https://github.com/pacparser/pacparser/archive/1.3.6.tar.gz"
  sha256 "c1f6f2ccd4fec329175f882102e47c57328e8e6e16aa9dbd4f8b859f9a028e83"

  depends_on "python" => :optional

  head do
    url "https://github.com/pacparser/pacparser.git", :using => :git, :branch => "master"
  end

  def install
    ENV.deparallelize
    system "cd src && make && make install PREFIX=#{prefix}"
    if build.with? "python"
      system "cd src && make pymod && make install-pymod PREFIX=#{prefix}"
    end
  end
end
