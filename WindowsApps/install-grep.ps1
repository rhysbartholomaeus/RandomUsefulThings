#requires -version 4.0
<#
.SYNOPSIS
  Installs grep for use on Windows
.DESCRIPTION
  Uses the winget-installer.ps1 script (in ScriptUtilities) to install grep using Winget 
  and adds the software to the system path.
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  9-Oct-2021
  Purpose/Change: Initial script development
  
.EXAMPLE
  To install grep, issue the following command (as Administrator)
  ./install-grep.ps1
#>

#----------------------------------------------------[Setup]------------------------------------------------------------------
#Set Error Action to Stop when fault encountered
$ErrorActionPreference = "Stop"

$PACKAGE="GnuWin32.Grep"
$PATH="C:\Program Files (x86)\GnuWin32\bin"
#---------------------------------------------------[Script]-------------------------------------------------------------------
Write-Output "Invoking installation script..."

& "$PSScriptRoot\..\ScriptUtilities\winget-installer.ps1" -PACKAGE_ID $PACKAGE -PATH_AMENDMENT $PATH
