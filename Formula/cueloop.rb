# cueloop Homebrew formula (binary install).
#
#   brew tap mmurakaru/tap
#   brew install cueloop
#
# Pulls the self-contained binary for the host platform from the GitHub Release
# (the Bun runtime is bundled in - no Node, no separate Bun). Per release, bump
# `version` and paste the four sha256 values from the release's checksums.txt.
class Cueloop < Formula
  desc "Terminal review surface for coding agents: annotate plans and diffs, return a verdict"
  homepage "https://cueloop.dev"
  version "0.1.0-alpha.56"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "685d88b928bc7c8bb3b6809ba41b05d462072429ae51c3a3406f7fe511201d29"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "52951dd601a4c996f7f2190ab0e3f2079e02b420e00769cbed5813ed341d19f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "89293e84486ba1b7a6a0a54adb6d86935cfc180dbe92cbc5dd4de382e5ed55bd"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "118413f4b505738319552e211808aaeb79e5d407dfa040071d3e9f24cdf14616"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
