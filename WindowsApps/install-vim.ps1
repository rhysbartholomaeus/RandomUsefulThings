#requires -version 4.0
<#
.SYNOPSIS
  Installs VIM for use on Windows
.DESCRIPTION
  Uses the 'winget' feature of Windows to download and install VIM.
  Adds the default VIM install directory to the Windows SYSTEM path
  Sets an alias to allow users to invoke VIM using 'vi'
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  9-Oct-2021
  Purpose/Change: Initial script development
  
.EXAMPLE
  To install VIM, issue the following command (as Administrator)
  ./install-vim.ps1
#>

#----------------------------------------------------[Setup]------------------------------------------------------------------
#Set Error Action to Stop when fault encountered
$ErrorActionPreference = "Stop"

$PACKAGE="vim.vim"
$PATH="C:\Program Files\Vim\vim82"
$ALIAS="vi vim"

#---------------------------------------------------[Script]-------------------------------------------------------------------
Write-Output "Invoking installation script..."

& "$PSScriptRoot\..\ScriptUtilities\winget-installer.ps1" -PACKAGE_ID $PACKAGE -PATH_AMENDMENT $PATH -ALIAS_AMENDMENT $ALIAS
