class Tgbounce < Formula
  desc "Simple Telegram assistant"
  homepage "https://github.com/azhuchkov/tgbounce"
  url "https://github.com/azhuchkov/tgbounce/archive/refs/heads/main.zip"
  version "0.1.0"
  license "MIT"

  depends_on "python3"

  head do
    url "https://github.com/azhuchkov/tgbounce.git", branch: "main"
  end

  def install
    prefix.install Dir["*"]
  end

  def tgbounce_log_path
    var/"log/#{name}.log"    
  end

  service do
    environment_variables PATH: std_service_path_env

    run ["/usr/bin/env", "python3", opt_prefix/"tgbounce.py"]

    working_dir HOMEBREW_PREFIX

    log_path f.tgbounce_log_path
    error_log_path f.tgbounce_log_path

    keep_alive true
  end
end
