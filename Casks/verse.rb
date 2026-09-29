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

  zap trash: [
    "~/Library/Application Support/Verse",
  ]

  caveats <<~EOS
    Verse is not notarized. If macOS says it can't verify Verse on first
    launch, open System Settings > Privacy & Security and click Open Anyway.
  EOS
end
