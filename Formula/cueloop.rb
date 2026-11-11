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
  version "0.1.0-alpha.118"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "fba5ef7e1b051984cf58a206526661ca38e14ea27b86d7b5ad972f8f040aafd7"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "0629bef619134b2388b773c8ab7720f2d4ad1b3f41819debdaa05164659b5859"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "cb4013cab2770277fedc90584b3928d36cf9544da6ca1dc9aa222b99e157568f"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "aa4a7955e65fd22438eeedbdb343cbadf30a04b4a06c152af2301ebc7c89cfd1"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
