import "theme" as theme;

let font = theme::font;
let icon = theme::icon;
let palette = theme::palette;

export let eggs = #{
    git: #{
	targets: #{
	".gitconfig": "~/.gitconfig",
	},
	templates: [".gitconfig"],
    },
    lazygit: #{
	targets: "~/.config/lazygit/"
    },
    nvim: #{
	enabled: io::command_available("nvim"),
	targets: "~/.config/nvim/",
    },
    wezterm: #{
	enabled: io::command_available("wezterm"),
	targets: "~/.config/wezterm/",
	templates: ["wezterm.lua", "keymap.lua", "appearance.lua"],
    },
    yazi: #{
	targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/yazi/config/" } else { "~/.config/yazi/" },
    },
    zed: #{
	targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/Zed/" } else { "~/.config/zed/" },
    },

    // Linux Explicit
    bash: #{
	enabled: SYSTEM.platform == "Linux",
	targets: #{
	".bash_aliases": "~/.bash_aliases",
	".bash_profile": "~/.bash_profile",
	".bashrc": "~/.bashrc",
	}, 
	templates: [".bash_aliases",".bash_profile",".bashrc"],
    },
    desktop: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.local/share/applications/",
	strategy: "merge",
    },
    dunst: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/dunst",
	templates: ["dunstrc"]
    },
    fuzzel: #{
	enabled: SYSTEM.platform == "Linux",
	templates: ["fuzzel.ini", "clipboard.ini", "emoji.ini", "wifi.ini"]
    },
    niri: #{
	enabled: io::command_available("niri"),
	targets: "~/.config/niri/",
	templates: ["config.kdl", "layout.kdl", "output.kdl"],
    },
    swaylock: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/swaylock",
    },
    systemd: #{
	enabled: SYSTEM.platform == "Linux",
	targets: #{ "user": "~/.config/systemd/user", },
	},
    tealdeer: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/tealdeer",
	templates: ["user"],
	strategy: "merge",
    },
	vicinae: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/vicinae",
	},
    waybar: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/waybar/",
	templates: ["style.scss"]
    },
    zsh: #{
	enabled: SYSTEM.platform == "Linux",
	targets: #{
	".zshenv": "~/.zshenv",
	".zprofile": "~/.zprofile",
	".zshrc": "~/.zshrc",
	}, 
	templates: [".zshenv",".zprofile",".zshrc"],
	main_file: "config"
    },

    // Windows Explicit
    glzr: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.glzr/",
	strategy: "merge",
    },
    komorebi: #{
	enabled: SYSTEM.platform == "Windows",
	targets: #{
	"applications.json": "~/applications.json",
	"komorebi.json": "~/komorebi.json",
	"whkdrc": "~/.config/whkdrc",
	},
	templates: ["application.json","komorebi.json","whkdrc"],
    },
    nushell: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.config/nushell/",
	strategy: "merge",
    },
    yasb: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.config/yasb/",
	strategy: "merge",
    }
};
