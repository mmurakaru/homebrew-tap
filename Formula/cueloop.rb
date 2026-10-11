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
  version "0.1.0-alpha.105"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "3d91bb9296396aaf2115880a3bb4d86f70354bbb2cb757173fa1f5b1ae596e85"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "fdfbaa4272ace7b6a0be141c1d94055f99eef846fb5aa2ee3d2a2361a5227823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "e3656c64dc16f804800f327cacfa9b61dd5fbcacb23c3dfe2b48c31303d8e9c1"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "6344c671b99b9d3873a20d09bd9aac0900ef86e8292fea7626df7676ce897864"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
