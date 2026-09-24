$env.YOLK_DIR = (((try { $env.HOME } catch { $env.USERPROFILE }) | path join '.dotfiles'))
$env.YAZI_FILE_ONE = (((try { $env.HOME } catch { $env.USERPROFILE }) | path join 'scoop\apps\git\current\usr\bin\file.exe'))
