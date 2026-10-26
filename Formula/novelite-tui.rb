class NoveliteTui < Formula
  desc "Focused writing in your terminal"
  homepage "https://github.com/hirovel/novelite-tui"
  url "https://github.com/hirovel/novelite-tui/releases/download/v0.1.0/novelite-tui-v0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "6b841dbc71491d3193e0a6240a1b2755cf5d3f75729d71c957fb686e49009a89"
  license "GPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "novelite-tui"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_equal "Novelite TUI #{version}", shell_output("#{bin}/novelite-tui --version").strip
    assert_match "Usage: novelite-tui", shell_output("#{bin}/novelite-tui --help")
    assert_match "Interactive terminal required",
                 shell_output("#{bin}/novelite-tui #{testpath}/draft.md 2>&1", 1)
    refute_path_exists testpath/"draft.md"
  end
end
