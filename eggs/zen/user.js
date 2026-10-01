// [SECURITY]
// HTTPS-only
user_pref("dom.security.https_only_mode", true); // [false]
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true); // [false]

// [PRIVACY]
// Set content blocking to strict
user_pref("browser.contentblocking.category", "strict");

// [APPEARANCE]
// Fade out unloaded tab
user_pref("browser.tabs.fadeOutUnloadedTabs", true); // [false]
// Show the tab's container in the url bar
user_pref("zen.urlbar.show-contextual-id", true); // [false]
// Return the tab throbber loading animation
user_pref("zen.theme.hide-tab-throbber", false); // [true]

// [FUNCTION]
// Open bookmark in a new tab instead of replacing current one
user_pref("browser.tabs.loadBookmarksInTabs", true); // [false]
// Do not hide the mute button in collapsed mode
user_pref("zen.view.sidebar-collapsed.hide-mute-button", false); // [true]
// Horizontal scrolling modifier key is shift, so setting workspaces scroll modifier to match
user_pref("zen.workspaces.scroll-modifier-key", "shift"); // [ctrl]
// Enable changing tab by scrolling
user_pref("toolkit.tabbox.switchByScrolling", true); // [false]
