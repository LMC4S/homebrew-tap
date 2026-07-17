cask "verse" do
  version "1.1.0"
  sha256 "a3e3df90ca1fdcb41da4f490f5dcd312bbe9744629e4b0f30db13e1734dfd47a"

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
    Verse is not signed or notarized. If macOS blocks the first launch,
    right-click Verse in /Applications and choose Open.
  EOS
end
