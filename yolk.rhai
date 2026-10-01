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
		targets: "~/.config/nvim/",
    },
    wezterm: #{
		targets: "~/.config/wezterm/",
		templates: ["*.lua"],
    },
    yazi: #{
		targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/yazi/config/" } else { "~/.config/yazi/" },
    },
    zed: #{
		enabled: io::command_available("nvim"),
		targets: if SYSTEM.platform == "Windows" { "~/AppData/Roaming/Zed/" } else { "~/.config/zed/" },
    },
	zen: #{
		enabled: false,
		targets: "~/.config/zen/*.Default (release)"
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
    environment: #{
		enabled: SYSTEM.platform == "Linux",
		targets: "~/.config/environment.d",
		templates: ["dunstrc"]
    },
    fuzzel: #{
		enabled: SYSTEM.platform == "Linux",
		templates: ["*.ini"]
    },
    niri: #{
		enabled: SYSTEM.platform == "Linux",
		targets: "~/.config/niri/",
		templates: ["*.kdl"],
    },
    sway: #{
		enabled: SYSTEM.platform == "Linux",
		targets: #{
		"swayidle": "~/.config/swayidle",
		"swaylock": "~/.config/swaylock",
		},
    },
    swayosd: #{
		enabled: SYSTEM.platform == "Linux",
		targets: #{
		"style.css": "~/.config/swayosd/style.css",
		},
		templates: ["*.scss"],
    },
    systemd: #{
		enabled: SYSTEM.platform == "Linux",
		targets: #{
		"keepassxc.service": "~/.config/systemd/user/keepassxc.service",
		"swaybg.service": "~/.config/systemd/user/swaybg.service",
		"swayidle.service": "~/.config/systemd/user/swayidle.service",
		"swayosd-server.service": "~/.config/systemd/user/swayosd-server.service",
		},
	},
    tealdeer: #{
		enabled: SYSTEM.platform == "Linux",
		targets: "~/.config/tealdeer",
		templates: ["user"],
		strategy: "merge",
    },
	vicinae: #{
		enabled: false,
		targets: "~/.config/vicinae",
	},
    waybar: #{
		enabled: SYSTEM.platform == "Linux",
		targets: #{
		"style.css": "~/.config/waybar/style.css",
		"config.jsonc": "~/.config/waybar/config.jsonc",
		},
		templates: ["*.scss"]
    },
    zsh: #{
		enabled: SYSTEM.platform == "Linux",
		targets: #{
		".zshenv": "~/.zshenv",
		".zprofile": "~/.zprofile",
		".zshrc": "~/.zshrc",
		}, 
		templates: [".zshenv",".zprofile",".zshrc"],
		main_file: "conf.d"
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
