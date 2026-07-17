cask "verse" do
  version "1.1.2"
  sha256 "f0a41313df8c2ae9befc9b53b0bde4f284c7fb2f608ba77babdb3e061682c506"

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
