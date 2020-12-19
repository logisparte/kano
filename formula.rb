# frozen_string_literal: true

class Kano < Formula
  desc "Software engineering task management CLI"
  homepage "https://github.com/logisparte/kano"
  url "https://packages.logisparte.com/kano/kano-${VERSION}.tar.gz"
  sha256 "${CHECKSUM}"
  license "GPL-3.0-only"
  depends_on "logisparte/packages/shell-helpers"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"kano")
  end

  test do
    help_output = shell_output(
      "export SHELL_HELPERS=\"$(brew --prefix)/opt/shell-helpers/libexec\" && kano help",
    )

    assert_match /Show this help message/, help_output
  end
end