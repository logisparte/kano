# frozen_string_literal: true

class ${PASCAL_CASED_PACKAGE} < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/${RELEASE}/kano.tar.gz"
  version "${VERSION}"
  sha256 "${CHECKSUM}"
  license "GPL-3.0-only"
  depends_on "git" => :optional

  def install
    libexec.install Dir["libexec/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (libexec/"kano")
  end

  def caveats
    <<~EOS
      Homebrew formula does not support this syntax:
        depends_on cask: "docker" => :optional

      So, optionally do:
        brew install --cask docker

      To install Docker Desktop
    EOS
  end

  test do
    help_output = shell_output("kano help")
    assert_match(/Show this help message/, help_output)
  end
end
