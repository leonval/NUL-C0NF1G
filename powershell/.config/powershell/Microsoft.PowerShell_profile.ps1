Set-Alias -Name lg -Value lazygit
Set-Alias -Name vim -Value nvim

function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}

oh-my-posh init pwsh --config $env:USERPROFILE\.config\oh-my-posh\nul-omp.toml | Invoke-Expression
