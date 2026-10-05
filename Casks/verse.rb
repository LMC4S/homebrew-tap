cask "verse" do
  version "1.7.2"
  sha256 "2e0ae7fa1246851a9bec2e788deda992e640ca198cea6c6a4b9f267112dbb1b1"

  url "https://github.com/LMC4S/verse/releases/download/v#{version}/Verse-#{version}-arm64.dmg"
  name "Verse"
  desc "Whisper voice transcription in the macOS menu bar"
  homepage "https://github.com/LMC4S/verse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Verse.app"

  # Not notarized: macOS 27 reports quarantined copies as "damaged".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Verse.app"]
  end

  zap trash: [
    "~/Library/Application Support/Verse",
  ]

  caveats <<~EOS
    Verse is not notarized, so this cask removes the quarantine flag
    from Verse.app after installing it.
  EOS
end
