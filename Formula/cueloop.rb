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
  version "0.1.0-alpha.59"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "036c617642ab0ea492bd5d95bd930824231078ba5b6ea3aa7651233b6f0106df"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "81ca036ad804539433c21629ea3cc28094e1271e6650e9ca7bce3449cf24bb7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "92db871273ed129aac985fe857d5767b9be85d4aad8301d0ad6d192981373eb8"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "271fcc595947c60184aad3dc11bc9dcb90d9d9bc12737ac3d3acfe27b0d478bd"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
