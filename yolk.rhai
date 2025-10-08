export let eggs = #{
    nvim: #{
	enabled: io::command_available("nvim"),
	targets: "~/.config/nvim/",
    },
    niri: #{
	enabled: io::command_available("niri"),
	targets: "~/.config/niri/",
	templates: ["config.kdl"],
    },
    wezterm: #{
	enabled: io::command_available("wezterm"),
	targets: "~/.config/wezterm/",
    },
    zsh: #{
	targets: #{
	".zshenv": "~/.zshenv",
	".zshrc": "~/.zshrc",
	}, 
	templates: [".zshenv",".zshrc"],
    },
};
