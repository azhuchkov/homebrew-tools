class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.1.0.alpha.tar.gz"
  version "0.1.0.alpha"
  sha256 "b7e9582cb8f68092025fb31de89e326a63702620bf36e8034923c2067ce53336"
  license "MIT"

  def install
    bin.mkpath
    bin.install "tunblkctl"
  end
end
