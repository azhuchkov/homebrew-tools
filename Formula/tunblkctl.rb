class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.1.0.alpha.tar.gz"
  version "0.1.0.alpha"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  def install
    prefix.install "tunblkctl-0.1.0.alpha/LICENSE", "tunblkctl-0.1.0.alpha/README.md"
    bin.mkpath
    bin.install "tunblkctl-0.1.0.alpha/tunblkctl"
  end
end
