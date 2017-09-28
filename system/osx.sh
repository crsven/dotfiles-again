#!/bin/sh

set -e

echo "Close any open System Preferences panes, to prevent them from overriding settings we’re about to change"
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Save screenshots to Dropbox"
defaults write com.apple.screencapture location -string "${HOME}/Dropbox/screenshots"

echo "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "Expand the File Info panes"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

echo "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo "Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

echo "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

echo "Automatically hide the dock"
defaults write com.apple.dock autohide -bool true

echo "Clear dock of all apps"
defaults write com.apple.dock checked-for-launchpad -bool true
defaults write com.apple.dock persistent-apps -string "()"

echo "Set the dock icon size"
defaults write com.apple.dock tilesize -int 36

echo "Empty trash securely"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo "Finder: Always open everything in list view"
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

echo "Disable autocorrect"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Set keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Set delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 35

echo "Remap capslock to control"
ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' - | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

echo "Do not create .DS_Store on network shares"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable top hit background preloading in Safari"
defaults write com.apple.Safari PreloadTopHit -bool false

echo "Disable quick website search in Safari"
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false

echo "Disable search engine suggestions in Safari"
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo "Set do not track HTTP header"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Enable developer mode in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true

echo "Change default search engine to DuckDuckGo"
defaults write com.apple.Safari SearchProviderIdentifier -string "com.duckduckgo"

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Only show scrollbars when scrolling"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

echo "Kill affected applications"
for app in "Dock" \
           "Finder" \
           "Google Chrome" \
           "Safari" \
           "SystemUIServer"; do
           killall "$app" >/dev/null 2>&1; done

echo "Done. Note that some of these changes require a logout/restart to take effect."
