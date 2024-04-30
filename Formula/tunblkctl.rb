class Tunblkctl < Formula
  desc "Command-line frontend for Tunnelblick"
  homepage "https://github.com/azhuchkov/tunblkctl"
  url "https://github.com/azhuchkov/tunblkctl/archive/refs/tags/v0.5.0.tar.gz"
  version "0.5.0"
  sha256 "875f639c4ad883ee93dbe46442a289b81f5178f9d6eb2a0ef8fe92d9e8cb9394"
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
    fish_completion.install "completion/fish.sh" => "tunblkctl.fish"

    man1.install "doc/man1/tunblkctl.1"
  end

  def caveats
    <<~EOS
      It's necessary to restart the shell after the formula installation.
    EOS
  end
end
