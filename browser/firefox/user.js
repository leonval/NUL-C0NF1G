// 2. Profile Preparation
user_pref("browser.preferences.defaultPerformanceSettings.enabled", false);

// 3. Network Performance
user_pref("network.http.max-connections", 900);
user_pref("network.http.max-persistent-connections-per-server", 6);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 3);
user_pref("network.http.request.max-start-delay", 10);
user_pref("network.http.pacing.requests.enabled", true);
user_pref("network.http.pacing.requests.burst", 16);
user_pref("network.http.pacing.requests.min-parallelism", 6);
user_pref("network.dnsCacheExpiration", 600);
user_pref("network.dnsCacheExpirationGracePeriod", 120);
user_pref("network.dnsCacheEntries", 10000);
user_pref("network.ssl_tokens_cache_capacity", 32768);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.prefetch-next", false);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.places.speculativeConnect.enabled", false);

// 4. Memory & Caching
user_pref("browser.cache.disk.enable", true);
user_pref("browser.cache.memory.capacity", 65536);
user_pref("browser.cache.memory.max_entry_size", 32768);
user_pref("browser.cache.disk.metadata_memory_limit", 16384);
user_pref("browser.cache.max_shutdown_io_lag", 100);
user_pref("image.cache.size", 10485760);
user_pref("image.mem.decode_bytes_at_a_time", 65536);
user_pref("image.mem.shared.unmap.min_expiration_ms", 90000);
user_pref("media.memory_cache_max_size", 524288);
user_pref("media.memory_caches_combined_limit_kb", 2097152);
user_pref("media.cache_readahead_limit", 600);
user_pref("media.cache_resume_threshold", 300);
user_pref("dom.storage.default_quota", 20480);
user_pref("dom.storage.shadow_writes", true);
user_pref("browser.sessionstore.interval", 60000);
user_pref("browser.sessionhistory.max_total_viewers", 2);
user_pref("browser.sessionstore.max_tabs_undo", 15);

// 5. JavaScript & Content
user_pref("content.notify.ontimer", true);
user_pref("content.notify.interval", 100000);
user_pref("gfx.content.skia-font-cache-size", 32);

// 6. GPU & Rendering
user_pref("gfx.webrender.all", true);
user_pref("gfx.canvas.accelerated.cache-items", 32768);
user_pref("gfx.canvas.accelerated.cache-size", 4096);

// 7. UI Responsiveness
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.msdPhysics.enabled", false);
user_pref("general.smoothScroll.currentVelocityWeighting", 0);
user_pref("apz.overscroll.enabled", false);
user_pref("general.smoothScroll.stopDecelerationWeighting", 1);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 150);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 50);
user_pref("mousewheel.min_line_scroll_amount", 18);
user_pref("mousewheel.scroll_series_timeout", 10);

// 8. Processes & Tabs
user_pref("dom.ipc.processPriorityManager.backgroundUsesEcoQoS", false);

// 9. Media & Codecs
user_pref("dom.media.webcodecs.h265.enabled", true);

// 10. Security & Privacy
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.query_stripping.enabled", true);
user_pref("privacy.query_stripping.enabled.pbmode", true);

// 11. Windows 11 Platform-Specific
user_pref("timer.auto_increase_timer_resolution", true);
user_pref("widget.windows.mica", false);
user_pref("widget.windows.mica.popups", 3);
user_pref("widget.windows.mica.toplevel-backdrop", 3);

// 12. Zen-Exclusive Features
user_pref("reader.parse-on-load.enabled", false);
