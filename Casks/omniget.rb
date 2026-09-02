cask "omniget" do
  version "0.9.0"

  on_arm do
    sha256 "8ab2459e54a324fcc8688bfe737e1173018eeedfb6e317e2d8b481697e3d04ef"
    url "https://github.com/tonhowtf/omniget/releases/download/v#{version}/omniget_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "b5d5714d0cd633da82cdf5ff70e0dd98d68b2e28eb24776e66ea29ef3e73a5be"
    url "https://github.com/tonhowtf/omniget/releases/download/v#{version}/omniget_#{version}_x64.dmg"
  end

  name "OmniGet"
  desc "Downloader for videos, audio and online courses"
  homepage "https://github.com/tonhowtf/omniget"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "omniget.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/omniget.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/wtf.tonho.omniget",
    "~/Library/Caches/wtf.tonho.omniget",
    "~/Library/Preferences/wtf.tonho.omniget.plist",
    "~/Library/Saved Application State/wtf.tonho.omniget.savedState",
    "~/Library/WebKit/wtf.tonho.omniget",
  ]

  caveats <<~EOS
    OmniGet is not notarized with Apple yet. The quarantine flag is cleared
    after install so the app opens normally; if macOS still refuses, allow it
    under System Settings > Privacy & Security.
  EOS
end
