class ConsulBackinator < Formula
  desc "Consul backup and restoration application"
  homepage "https://github.com/myENA/consul-backinator"
  url "https://github.com/myENA/consul-backinator.git",
    tag: "v1.2",
    revision: "97c3d8506f332ba86b3af922cc20adb734c81dbc"
  head "https://github.com/myENA/consul-backinator.git"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath

    dir = buildpath/"src/github.com/myENA/consul-backinator"
    dir.install buildpath.children

    ENV.prepend_create_path "PATH", buildpath/"bin"

    cd dir do
      system "make"
      bin.install "consul-backinator"
    end
  end

  test do
    ## testing requires access consul
  end
end
