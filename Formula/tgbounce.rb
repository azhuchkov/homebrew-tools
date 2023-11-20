class Tgbounce < Formula
  include Language::Python::Virtualenv

  desc "Simple Telegram assistant"
  homepage "https://github.com/azhuchkov/tgbounce"
  url "https://github.com/azhuchkov/tgbounce/archive/refs/heads/main.zip"
  version "0.1.0"
  license "MIT"

  head do
    url "https://github.com/azhuchkov/tgbounce.git", branch: "main"
  end

  depends_on "python3"

  def install
    venv = virtualenv_create(libexec, "python3")

    venv.pip_install "python-telegram==0.18.0"
    venv.pip_install "jq==1.6.0"
    venv.pip_install "telegram-text==0.1.2"

    libexec.install "tgbounce.py"

    share.install ["config.ini", "bounces.json"]
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
    run ["/usr/bin/env", libexec/"bin/python3", libexec/"tgbounce.py"]

    working_dir HOMEBREW_PREFIX

    log_path f.tgbounce_log_path
    error_log_path f.tgbounce_log_path

    keep_alive true
  end
end
