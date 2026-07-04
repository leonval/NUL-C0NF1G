import "theme" as theme;

let font = theme::font;
let icon = theme::icon;
let palette = theme::palette;

export let eggs = #{
    wezterm: #{
	enabled: io::command_available("wezterm"),
	targets: "~/.config/wezterm/",
	templates: ["wezterm.lua"],
    },
    nvim: #{
	enabled: io::command_available("nvim"),
	targets: "~/.config/nvim/",
    },
    git: #{
	targets: #{
	".gitconfig": "~/.gitconfig",
	},
	templates: [".gitconfig"],
    },
    zed: #{
	targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/Zed/" } else { "~/.config/zed/" },
    },
    yazi: #{
	targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/yazi/config/" } else { "~/.config/yazi/" },
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
    niri: #{
	enabled: io::command_available("niri"),
	targets: "~/.config/niri/",
	templates: ["config.kdl"],
    },
    systemd: #{
	enabled: SYSTEM.platform == "Linux",
	targets: #{
	"user": "~/.config/systemd/user",
	},
	templates: ["user"],
	strategy: "merge",
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
    swaylock: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/swaylock",
    },
    waybar: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/waybar/",
	templates: ["style.scss"]
    },
    fuzzel: #{
	enabled: SYSTEM.platform == "Linux",
	templates: ["fuzzel.ini", "clipboard.ini", "emoji.ini", "wifi.ini"]
    },
    tealdeer: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.config/tealdeer",
    },

    // Windows Explicit
    nushell: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.config/nushell/",
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
    glzr: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.glzr/",
	strategy: "merge",
    },
    yasb: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.config/yasb/",
	strategy: "merge",
    }
};
