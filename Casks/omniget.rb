cask "omniget" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "cd1533f36960be5c545c04f9102f27d2901316ad3f9d05311b15a938a77ce118",
         intel: "e8973b792bd91938d88bcd4937efecf278881a7262d0d0237bd3675361d188e0"

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
