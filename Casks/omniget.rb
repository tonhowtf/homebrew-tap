cask "omniget" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "adb2c09e71ad65164976cfa0a7bdf0a1305608d515695caf65cd5a73824f79b3",
         intel: "e7a6ea174e71237cffba2b029e1b5d60155e727f216360b061a05b7213e1dced"

  url "https://getomniget.com/dl/v#{version}/omniget_#{version}_#{arch}.dmg"
  name "OmniGet"
  desc "Local MCP server with a desktop toolbox for coding agents, and a downloader"
  homepage "https://getomniget.com/"

  livecheck do
    url "https://getomniget.com/update/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "omniget.app"

  zap trash: "~/Library/Application Support/wtf.tonho.omniget"

  caveats <<~EOS
    OmniGet is not notarized by Apple yet. If macOS says the app is damaged, run:

      xattr -cr /Applications/omniget.app
      codesign --force --deep --sign - /Applications/omniget.app
  EOS
end
