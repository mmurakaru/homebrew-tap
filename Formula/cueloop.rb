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
  version "0.1.0-alpha.58"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-arm64"
      sha256 "458572c392998b982348b917cb3f6d1b452ae15220d7bc8a1a2cf517b7145b1a"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-darwin-x64"
      sha256 "c13c3c588e40f710c3fe8ea4e4f80208cafdc650f6086cea50cecd7e0554fb7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-arm64"
      sha256 "5e7589384f26a3b5be35ceb2a993952637a7504ec8a884d68dc5b57a373d516c"
    end
    on_intel do
      url "https://github.com/mmurakaru/cueloop/releases/download/cueloop@#{version}/cueloop-linux-x64"
      sha256 "cc4d735ef08d409d12afce4deae01b4d89d3c90fec5ad1937681e526dd1faddb"
    end
  end

  def install
    bin.install Dir["cueloop-*"].first => "cueloop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cueloop --version")
  end
end
