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
  version "0.1.0-alpha.83"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "9a49aa7185bcc7e8245fed785dc832f6de2b0b356e534bfef6adaaf7d2c39444"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "9afabb60919ae3f256525cf34fe83438cc0db6ffd187c87bf680f1e5be9a6ec4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "e9c4371eae48e324e07d70c5a331d8e987c5e365d37edba83720457612bc7aae"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "5a7e11d7ee5a5cf633a10ed191fe03469a1a47abd04943d18a7ac9a7a9810fb4"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
