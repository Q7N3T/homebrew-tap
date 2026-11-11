cask "wirrow" do
  version "0.6.2"
  sha256 "d2f486672eac6e5ebf5bf4c15e0b84396622919890b6fee65c9f3476d3aa66f9"

  url "https://github.com/Q7N3T/wirrow/releases/download/v#{version}/Wirrow-#{version}.dmg"
  name "Wirrow"
  desc "Drag and drop files between a Mac and an Android phone or Nintendo Switch"
  homepage "https://q7n3t.github.io/wirrow/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Wirrow.app"

  zap trash: [
    "~/Library/Application Support/Wirrow",
    "~/Library/Caches/com.vadimgrekov.shuttle",
    "~/Library/Caches/Wirrow",
    "~/Library/HTTPStorages/com.vadimgrekov.shuttle",
    "~/Library/Preferences/com.vadimgrekov.shuttle.plist",
  ]

  caveats <<~EOS
    Wirrow is signed but not notarized by Apple. On first launch open
    System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
