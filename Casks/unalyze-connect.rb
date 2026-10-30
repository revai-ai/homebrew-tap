cask "unalyze-connect" do
  version "0.1.18"
  sha256 "13f6a4bc2d36f5f6c6b5f34e5fe1b955b3daadbfc88cfa9ae77b8f252eb15169"

  url "https://connect.base.un-alyze.com/production/#{version}/unalyze-connect-#{version}-macos-aarch64.app.zip"
  name "Unalyze Connect"
  desc "Syncs MetaTrader 5 accounts with Unalyze"
  homepage "https://www.un-alyze.com/"

  livecheck do
    url "https://connect.base.un-alyze.com/production/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Unalyze Connect.app"

  uninstall quit: "com.un-alyze.connect"

  zap trash: [
    "/Applications/.Unalyze Connect.app.failed",
    "/Applications/.Unalyze Connect.app.new",
    "/Applications/.Unalyze Connect.app.old",
    "~/Library/Application Support/com.un-alyze.connect",
    "~/Library/LaunchAgents/com.un-alyze.connect.plist",
  ]
end
