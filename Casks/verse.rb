cask "verse" do
  version "1.7.1"
  sha256 "3923c463a08861f460ecd8af018c3b1556c8cc17ee1c5869a8ce55fd14cc2f12"

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
