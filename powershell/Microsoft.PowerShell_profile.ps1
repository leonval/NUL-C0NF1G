Set-Alias -Name lg -Value lazygit
Set-Alias -Name vim -Value nvim

function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

$out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}

oh-my-posh init pwsh --config $env:USERPROFILE\.config\oh-my-posh\nul-omp.toml | Invoke-Expression
