function :q { exit }
function q { exit }
function w { wt }
function t { wt --window 0 }
function c { clear }
function e { explorer . }
function b { explorer shell:RecycleBinFolder }
function n { nvim . }
function f { firefoxfocusfix }

function cw
{
  cd C:\
  cd (which)
}
function ew
{
  cd C:\
  cd (which)
  explorer .
}
function nw
{
  cd C:\
  cd (which)
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  nvim .
}

function fh
{
  $find = $args
  Get-Content (Get-PSReadlineOption).HistorySavePath | ? {$_ -like "*$find*"} | Sort-Object -Unique -Descending
}
function nh
{
  $directory = Split-Path (Get-PSReadlineOption).HistorySavePath
  cd $directory
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  nvim .
}

function ep
{
  $directory = Split-Path $PROFILE
  cd $directory
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  explorer .
}
function np
{
  $directory = Split-Path $PROFILE
  cd $directory
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  nvim .
}

function attend
{
  cd C:\Users\conno\Documents\Programming\Web\AutoAttendance
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  .\script\run.bat -nowin
}
function music
{
  cd C:\Users\conno\Documents\Programming\CPP\TerminalMusicPlayer
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"

  if ($args.Count -eq 0) { .\binary\TerminalMusicPlayer.exe }
  elseif ($args -eq "-s")
  {
    $directoryPath = Get-Content -Path user\songs_directory.txt -First 1
    $selectedSong = Get-ChildItem -Path $directoryPath -File | ForEach-Object { $_.Name } | fzf
    if (![string]::IsNullOrWhiteSpace($selectedSong)) { .\binary\TerminalMusicPlayer.exe $selectedSong }
  }
  else { echo "Invalid argument: $args" }
}

function prompt
{
  $p = Split-Path -leaf -path (Get-Location)
  $Host.UI.RawUI.WindowTitle = "$p"
  "$pwd> "
}

oh-my-posh init pwsh --config "C:/posh/config.omp.json" | Invoke-Expression
