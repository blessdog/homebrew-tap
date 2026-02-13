class Roasty < Formula
  desc "Real-time dashboard for Claude Code sessions in Ghostty"
  homepage "https://github.com/blessdog/Roasty"
  url "https://github.com/blessdog/Roasty/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e90c0fd084a29e49ff0de3adeb85b3d5f1e04d926ef888c67328ef9f29ff0a95"
  license "MIT"

  depends_on "jq"

  def install
    libexec.install "dashboard.py"
    libexec.install "statusline.sh"
    libexec.install "setup.sh"
    libexec.install "launch.sh"
    libexec.install Dir["hooks"]
    bin.install "bin/roasty"
  end

  def caveats
    <<~EOS
      Run 'roasty setup' to complete installation:
        - Creates Python venv with Rich at ~/.claude/dashboard/
        - Configures Claude Code hooks in ~/.claude/settings.json
        - Sets up the status line

      Then open a Ghostty split and run 'roasty' to launch the dashboard.
    EOS
  end

  test do
    assert_match "roasty", shell_output("#{bin}/roasty version")
  end
end
