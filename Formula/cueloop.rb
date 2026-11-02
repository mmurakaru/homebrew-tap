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
  version "0.1.0-alpha.114"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "12b57e8b6689652aaa1345df5b00764c0163f13af9e1fe5128de9d7c5c38037e"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "31ab7a855184da5cb662f665815cfc106c1e496ca9e109c80db792a065a007cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "b1a1cb46f3edc65639eef202c9ff311a630132128eb235c6c0ba0cc069606d9e"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "7734fb034ac2ac6466d7ebf9f6d28395ac9759419f624cf3e20f392fdcfa085d"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
