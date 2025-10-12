$env.YOLK_DIR = (((try { $env.HOME } catch { $env.USERPROFILE }) | path join '.dotfiles'))
