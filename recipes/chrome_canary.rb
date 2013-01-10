dmg_package "Google Chrome Canary" do
  dmg_name "googlechrome"
  source "https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg"
  action :install
  owner WS_USER
end
