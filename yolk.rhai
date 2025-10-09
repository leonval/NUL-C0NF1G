export let eggs = #{
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
    },
    wezterm: #{
	enabled: io::command_available("wezterm"),
	targets: "~/.config/wezterm/",
    },
    nvim: #{
	enabled: io::command_available("nvim"),
	targets: "~/.config/nvim/",
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
};
