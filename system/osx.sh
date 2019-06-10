#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

set -e

# "Close any open System Preferences panes, to prevent them from overriding settings we’re about to change"
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

# "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# "Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# "Save screenshots to Dropbox"
defaults write com.apple.screencapture location -string "${HOME}/Dropbox/screenshots"

# "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

# "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# "Show the ~/Library folder"
chflags nohidden ~/Library

# "Show the /Volumes folder"
sudo chflags nohidden /Volumes

# "Expand the File Info panes"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

# Add iOS & Watch Simulator to Launchpad
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

# "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

# "Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

# "Automatically hide the dock"
defaults write com.apple.dock autohide -bool true

# "Clear dock of all apps"
defaults write com.apple.dock checked-for-launchpad -bool true
defaults write com.apple.dock persistent-apps -string "()"

# "Set the dock icon size"
defaults write com.apple.dock tilesize -int 36

# "Empty trash securely"
defaults write com.apple.finder EmptyTrashSecurely -bool true

# "Finder: Always open everything in list view"
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

# "Disable autocorrect"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# "Set keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

# "Set delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 35

# "Remap capslock to control"
ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' - | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

# "Do not create .DS_Store on network shares"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# "Disable top hit background preloading in Safari"
defaults write com.apple.Safari PreloadTopHit -bool false

# "Disable quick website search in Safari"
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false

# "Disable search engine suggestions in Safari"
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# "Set do not track HTTP header"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# "Enable developer mode in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# "Change default search engine to DuckDuckGo"
defaults write com.apple.Safari SearchProviderIdentifier -string "com.duckduckgo"

# "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# "Only show scrollbars when scrolling"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# "Kill affected applications"
for app in "Dock" \
           "cfprefsd" \
           "Finder" \
           "Google Chrome" \
           "Messages" \
           "Photos" \
           "Safari" \
           "SystemUIServer"; do
           killall "$app" >/dev/null 2>&1; done

# "Done. Note that some of these changes require a logout/restart to take effect."
