class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.2.0.alpha.tar.gz"
  version "0.2.0.alpha"
  sha256 "e4d3dfb6a37e3575aa1ca907229b064e9ba7e6c4aea5adfc492f1ac2565d23c0"
  license "MIT"

  head do
    url "https://github.com/azhuchkov/tunblkctl.git", branch: "main"
  end

  def install
    prefix.install "libexec"

    bin.mkpath
    bin.install "bin/tunblkctl"
  end
end
