cask "wirrow" do
  version "0.6.3"
  sha256 "32234cd76c963671f623ac30ffa78289d4c26f34eb450246d8bbdb018e2aea76"

  url "https://github.com/Q7N3T/wirrow/releases/download/v#{version}/Wirrow-#{version}.dmg"
  name "Wirrow"
  desc "Drag and drop files between a Mac and an Android phone or Nintendo Switch"
  homepage "https://q7n3t.github.io/wirrow/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

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
