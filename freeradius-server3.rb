require "formula"

class FreeradiusServer3 < Formula
  homepage "http://freeradius.org/"
  url "https://github.com/FreeRADIUS/freeradius-server/archive/release_3_0_9.tar.gz"
  sha256 "b901e027fdc0fab6d9cf794b5cfcb9d8a611bc69342d3c8aef061e36af9e30f5"
  sha1 "67c85468668fe2679cdd8db90f9346c5d5a7b074"

  # needs talloc and openssl
  depends_on "talloc"
  depends_on "openssl"
  depends_on "pcre"

  # optional depends for modules
  depends_on "mysql"        => :optional # rlm_sql
  depends_on "postgresql"   => :optional # rlm_sql
  depends_on "sqlite"       => :optional # rlm_sql
  depends_on "unixodbc"     => :optional # rlm_sql
  depends_on "freetds"      => :optional # rlm_sql
  depends_on "gdbm"         => :optional # rlm_ippool
  depends_on "json-c"       => :optional # rlm_rest
  depends_on "redis"        => :optional # rlm_redis, rlm_rediswho
  depends_on "ykclient"     => :optional # rlm_yubikey
  depends_on "libcouchbase" => :optional # rlm_couchbase

  option "stable-branch", "Build from the v3.0.x stable branch"

  if build.with? "stable-branch"
    url "https://github.com/FreeRADIUS/freeradius-server.git", :using => :git, :branch => "v3.0.x"
  end

  head do
    url "https://github.com/FreeRADIUS/freeradius-server.git", :using => :git, :branch => "master"
  end

  devel do
    url "https://github.com/FreeRADIUS/freeradius-server.git", :using => :git, :branch => "v3.1.x"
  end

  def install
    ENV.deparallelize

    args = %W[
      --prefix=#{prefix}
      --with-openssl-lib-dir=/usr/local/opt/openssl/lib
      --with-openssl-include-dir=/usr/local/opt/openssl/include
      --with-pcre-lib-dir=/usr/local/opt/pcre/lib
      --with-pcre-include-dir=/usr/local/opt/pcre/include
      --without-rlm_eap_ikev2
      --without-rlm_eap_tnc
      --without-rlm_sql_db2
      --without-rlm_sql_firebird
      --without-rlm_sql_iodbc
      --without-rlm_sql_oracle
      --without-rlm_securid
    ]

    args << "--enable-developer" if !build.stable?

    system "./configure", *args
    system "make"
    system "make install"
  end
end
