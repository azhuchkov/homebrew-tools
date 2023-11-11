class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/heads/main.zip"
  version "0.1.0.alpha"
  sha256 "3d530df2e6394869954ba225db84475eeb66be5d45498ccaa382119a9d5e2e2c"
  license "MIT"

  def install
    bin.mkpath
    bin.install "tunblkctl"
  end
end
