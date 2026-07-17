cask "verse" do
  version "1.4.0"
  sha256 "3c561217364c8bd07e1bd286fa9ea126f709370c692aa47fa007b7ef426f1245"

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
