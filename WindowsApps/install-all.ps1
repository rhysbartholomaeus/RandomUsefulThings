#requires -version 4.0
<#
.SYNOPSIS
  Runs all the installation scripts in this folder
.DESCRIPTION
  See synopsis.
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  9-Oct-2021
  Purpose/Change: Initial script development
  
.EXAMPLE
  To install all items, issue the following command (as Administrator)
  ./install-all.ps1
#>

#---------------------------------------------------[Script]-------------------------------------------------------------------
Write-Output "Executing all scripts in this directory..."

$INSTALL_FILES = Get-ChildItem $PSScriptRoot -exclude install-all.ps1

foreach ($FILE in $INSTALL_FILES){
  Write-Output "Running: $FILE"
  & "$FILE"
}