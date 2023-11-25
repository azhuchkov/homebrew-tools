class Tgbounce < Formula
  include Language::Python::Virtualenv

  desc "Simple Telegram assistant"
  homepage "https://github.com/azhuchkov/tgbounce"
  url "https://github.com/azhuchkov/tgbounce/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "38e6a563e02bd6e1b3ed6da8619dcffbf1d76598752d759bb8d81beada51b7ef"
  version "0.1.0"
  license "MIT"

  head do
    url "https://github.com/azhuchkov/tgbounce.git", branch: "main"
  end

  depends_on "python3"

  def install
    venv = virtualenv_create(libexec, "python3")

    venv.pip_install "-rrequirements.txt"

    libexec.install "src/tgbounce.py"

    prefix.install "share/"
    
    (bin/"tgbounce-network").write <<~EOS
      #!/bin/sh
      
      # Send signal to daemon to trigger TCP session update
    
      pkill -USR1 -t - -f tgbounce
    EOS

    chmod 0755, bin/"tgbounce-network"
  end

  def caveats
    <<~EOS
      Example configuration files have been installed to:
        #{share}

      To use these configurations, copy them to your home folder:
        mkdir -m 0700 ~/.tgbounce/ && install -b -m 0600 #{share}/{config.ini,bounces.json} ~/.tgbounce/

      Then run script manually as described below.
    EOS
  end

  def tgbounce_log_path
    var/"log/#{name}.log"    
  end

  service do
    run [libexec/"bin/python3", libexec/"tgbounce.py"]

    environment_variables PATH: std_service_path_env

    working_dir HOMEBREW_PREFIX

    log_path f.tgbounce_log_path
    error_log_path f.tgbounce_log_path

    keep_alive true
  end
end
