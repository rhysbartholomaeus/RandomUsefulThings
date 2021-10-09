#requires -version 4.0
<#
.SYNOPSIS
  Installs GSudo for use on Windows
.DESCRIPTION
  Uses the winget-installer.ps1 script (in ScriptUtilities) to install GSudo using Winget
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  9-Oct-2021
  Purpose/Change: Initial script development
  
.EXAMPLE
  To install GSudo, issue the following command (as Administrator)
  ./install-gsudo.ps1
#>

#----------------------------------------------------[Setup]------------------------------------------------------------------
#Set Error Action to Stop when fault encountered
$ErrorActionPreference = "Stop"

$PACKAGE="gerardog.gsudo"
#---------------------------------------------------[Script]-------------------------------------------------------------------
Write-Output "Invoking installation script..."

& "$PSScriptRoot\..\ScriptUtilities\winget-installer.ps1" -PACKAGE_ID $PACKAGE
