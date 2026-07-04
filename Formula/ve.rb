class Ve < Formula
  desc "Dump the frontmost macOS app's accessibility tree as JSON"
  homepage "https://github.com/mmurakaru/voicedit"
  url "https://github.com/mmurakaru/voicedit/releases/download/v1.0.0-rc.1/ve-v1.0.0-rc.1-macos-universal.tar.gz"
  version "1.0.0-rc.1"
  sha256 "1513bde17fe88805a9eee9c5f0304d8940f8074b59394c88a4cc8641f67dc1d8"
  license "MIT"

  def install
    bin.install "ve"
  end

  test do
    # Argument parsing runs before the Accessibility permission check, so this
    # exercises the binary without needing granted permission in the sandbox.
    output = shell_output("#{bin}/ve --bogus 2>&1", 1)
    assert_match "unknown argument", output
  end
end
