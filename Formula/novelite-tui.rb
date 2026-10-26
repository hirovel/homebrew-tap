class NoveliteTui < Formula
  desc "Focused writing in your terminal"
  homepage "https://github.com/hirovel/novelite-tui"
  url "https://github.com/hirovel/novelite-tui/releases/download/v0.1.1/novelite-tui-v0.1.1-aarch64-apple-darwin.tar.gz"
  version "0.1.1"
  sha256 "07b36e70210e864fb86eea407726c8ae832a7d4b4a99c54d59d8a9a3bd8eb9f9"
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
