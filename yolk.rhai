export let eggs = #{
    zsh: #{
	enabled: SYSTEM.platform == "Linux",
	targets: #{
	".zshenv": "~/.zshenv",
	".zshrc": "~/.zshrc",
	}, 
	templates: [".zshenv",".zshrc"],
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
