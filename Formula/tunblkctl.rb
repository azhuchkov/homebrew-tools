class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "55f75312cbba6a1b05074061c20f60e8931be8c78320706fe25cba6499a13b9d"
  license "MIT"

  head do
    url "https://github.com/azhuchkov/tunblkctl.git", branch: "main"
  end

  def install
    prefix.install "libexec"

    bin.mkpath
    bin.install "bin/tunblkctl"
    
    bash_completion.install "completion/bash.sh" => "tunblkctl"
    zsh_completion.install "completion/zsh.sh" => "_tunblkctl"

    man1.install "doc/man1/tunblkctl.1"
  end

  def caveats
    <<~EOS
      It's necessary to restart the shell after the formula installation.
    EOS
  end
end
