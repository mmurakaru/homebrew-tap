# cueloop Homebrew formula (binary install).
#
# This is the source of truth for the tap. Homebrew taps live in a repo named
# `homebrew-<tap>`, so this file ships to `mmurakaru/homebrew-tap` as
# `Formula/cueloop.rb`. Once tapped, `brew install cueloop` resolves here.
#
#   brew tap mmurakaru/tap
#   brew install cueloop
#
# The formula pulls the self-contained binary for the host platform from the
# GitHub Release (the Bun runtime is bundled in - no Node, no separate Bun).
#
# The release workflow bumps `version` and the four sha256 values from the
# release's checksums.txt via scripts/update-formula.ts and pushes here.
class Cueloop < Formula
  desc "Terminal review surface for coding agents: annotate plans and diffs, send a message"
  homepage "https://cueloop.dev"
  version "0.1.0-alpha.84"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "21ae1a4301875842fe77560d569acb5e89ef8a7e2c2aa71e9a0e8b61ee549e0e"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "3171552210eb780307408ff1e0816b693c83bef1ae4a333dba2cc0cbec9bfe14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "a9f5b0cf7b0f8662a8206bea273412ef8dd15c17f39e0a72720ab386c5e47ee4"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "42e043523878715f8fce36d7090c8bf0bf0a116c9840ba6f8cccdea00c3a8347"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
