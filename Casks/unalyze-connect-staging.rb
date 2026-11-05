cask "unalyze-connect-staging" do
  version "0.1.26"
  sha256 "3cfc3a951a5160d8763d68155d0bd2d3285dc640531705a6732cfed5be4c18ea"

  url "https://connect.base.un-alyze.com/staging/#{version}/unalyze-connect-#{version}-macos-aarch64.app.zip"
  name "Unalyze Connect (staging)"
  desc "Syncs MetaTrader 5 accounts with Unalyze"
  homepage "https://www.un-alyze.com/"

  livecheck do
    url "https://connect.base.un-alyze.com/staging/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Unalyze Connect (staging).app"

  uninstall quit: "com.un-alyze.connect.staging"

  zap trash: [
    "/Applications/.Unalyze Connect (staging).app.failed",
    "/Applications/.Unalyze Connect (staging).app.new",
    "/Applications/.Unalyze Connect (staging).app.old",
    "~/Library/Application Support/com.un-alyze.connect.staging",
    "~/Library/LaunchAgents/com.un-alyze.connect.staging.plist",
  ]
end
