class Roasty < Formula
  desc "Real-time dashboard for Claude Code sessions in Ghostty"
  homepage "https://github.com/blessdog/Roasty"
  url "https://github.com/blessdog/Roasty/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ea72572d5cd4002743e47bb5ced746fc1ab86e7f547889985c2612b1162351d5"
  license "MIT"

  depends_on "jq"

  def install
    libexec.install "dashboard.py"
    libexec.install "statusline.sh"
    libexec.install "ghostty.config"
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

      Optional: 'roasty ghostty' installs a recommended Ghostty config
      with tabs, splits, Citruszest theme, and Nerd Font support.

      Then open a Ghostty split and run 'roasty' to launch the dashboard.
    EOS
  end

  test do
    assert_match "roasty", shell_output("#{bin}/roasty version")
  end
end
