import "theme" as theme;

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
	targets: "~/.config/zed/",
    },
    kaizen: #{
	enabled: io::command_available("kaizen"),
	targets: "~/.config/kaizen/",
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
	targets: "~/.config/systemd/",
	strategy: "merge",
    },
    desktop: #{
	enabled: SYSTEM.platform == "Linux",
	targets: "~/.local/share/applications/",
	strategy: "merge",
    },

    // Windows Explicit
    nushell: #{
	enabled: SYSTEM.platform == "Windows",
	targets: "~/.config/nushell/",
	strategy: "merge",
    },
};
