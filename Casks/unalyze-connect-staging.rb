cask "unalyze-connect-staging" do
  version "0.1.18"
  sha256 "135f56323e5d7644e359b6a9b679577dd1f66e8f090bcf6c10a6e8da4ca484b1"

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
