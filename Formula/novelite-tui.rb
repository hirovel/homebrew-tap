class NoveliteTui < Formula
  desc "Focused writing in your terminal"
  homepage "https://github.com/hirovel/novelite-tui"
  url "https://github.com/hirovel/novelite-tui/releases/download/v0.2.1/novelite-tui-v0.2.1-aarch64-apple-darwin.tar.gz"
  version "0.2.1"
  sha256 "0e4b6e419cdba328e7deb396973d7a4271d81e5db7f05a4c6420219e54cdb136"
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
