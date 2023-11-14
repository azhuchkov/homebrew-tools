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
    
    if build.head?
      bash_completion.install "completion/bash.sh" => "tunblkctl"
      zsh_completion.install "completion/zsh.sh" => "_tunblkctl"

      man1.install "doc/man1/tunblkctl.1"
    end
  end

  def caveats
    <<~EOS
      It's necessary to restart the shell after the formula installation.
    EOS
  end
end
