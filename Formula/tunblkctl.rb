class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.3.0.alpha.tar.gz"
  version "0.3.0.alpha"
  sha256 "c80d78edfc32399f3b2e39b2621af97f9cea831306e03874237532d97af5cc89"
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
