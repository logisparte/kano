# frozen_string_literal: true

class ${PASCAL_CASED_PACKAGE} < Formula
  desc "Software engineering workflow automation CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://github.com/logisparte/kano/releases/download/${RELEASE}/kano.tar.gz"
  version "${VERSION}"
  sha256 "${CHECKSUM}"
  license "Apache-2.0"
  depends_on "git" => :optional

  def install
    lib.install Dir["lib/*"]
    doc.install Dir["share/doc/*"]
    prefix.install "LICENSE"
    bin.write_exec_script (lib/"kano")
  end

  def caveats
    <<~EOF
      Homebrew formula does not support this syntax:
        depends_on cask: "docker" => :optional

      So to (optionally) install Docker Desktop, do:
        brew install --cask docker
    EOF
  end

  test do
    help_output = shell_output("#{bin}/kano help")
    assert_match(/Show this help message/, help_output)
  end
end
