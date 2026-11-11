cask "unalyze-connect-staging" do
  version "0.1.29"
  sha256 "1be8daad53f29c4180dad1d0ae426d23f00a42c75d563f518334190744944880"

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
  depends_on macos: :monterey

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
