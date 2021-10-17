#requires -version 4.0
#requires -RunAsAdministrator
<#
.SYNOPSIS
  Install script that copies a number of useful command-line based shortcuts that provide functionality akin to Linux.
.DESCRIPTION
  Copies all .BAT scripts from the 'cli-scripts' folder into a new folder called C:\aliases.
  Adds the 'aliases' folder to the Windows system PATH variable.
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  17-Oct-2021
  Purpose/Change: Initial script development
.EXAMPLE
  ./install-cli-shortcuts.ps1
#>

#----------------------------------------------------[Setup]------------------------------------------------------------------
#Set Error Action to Stop when fault encountered
$ErrorActionPreference = "Stop"

$ProcessError = $null

$ALIASPATH='C:\aliases'

#----------------------------------------------------[Script]------------------------------------------------------------------
Try {
  if(!(Test-Path -Path $ALIASPATH)){
    New-Item -Path $ALIASPATH -ItemType "directory"
  }

  Copy-Item -Path "$PSScriptRoot\cli-shortcuts\*" -Destination $ALIASPATH -Recurse

  #Add the requested directory to the Windows SYSTEM Path
  if($ALIASPATH){
    Write-Output "Adding $ALIASPATH to SYSTEM PATH..."
    [Environment]::SetEnvironmentVariable(
        "Path",
        [Environment]::GetEnvironmentVariable("Path",
        [EnvironmentVariableTarget]::Machine) + ";$ALIASPATH",
        [EnvironmentVariableTarget]::Machine)
  }
}
Catch {
  $ProcessError=$_.Exception
}
if($null -ne $ProcessError){
  Write-Warning -Message "Installation failed."
  Write-Error $ProcessError.Message
}else{
  Write-Output "Success."
}