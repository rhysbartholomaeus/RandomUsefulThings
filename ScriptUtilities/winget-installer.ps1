#requires -version 4.0
#requires -RunAsAdministrator
<#
.SYNOPSIS
  Small wrapper script for the winget functionality in Windows
.DESCRIPTION
  Uses the 'winget' feature of Windows to download and install VIM.
  Adds the default VIM install directory to the Windows SYSTEM path
  Sets an alias to allow users to invoke VIM using 'vi'
.NOTES
  Version:        1.0
  Author:         RJB
  Creation Date:  9-Oct-2021
  Purpose/Change: Initial script development
.PARAMETER PACKAGE_ID
  The winget package ID required to install the software.
.PARAMETER PATH_AMENDMENT
  Optional parameter that adds an executable directory to the SYSTEM PATH environment variable.
.PARAMETER ALIAS_AMENDMENT
  Optional parameter that adds an alias to the %USERPROFILE% PowerShell active profile.
.EXAMPLE
  To install VIM, issue the following command (as Administrator)
  ./winget-installer.ps1 -PACKAGE_ID="vim.vim"
#>

#----------------------------------------------------[Params]------------------------------------------------------------------
# The winget package id, which is required to install the software
Param(
  [Parameter(Mandatory)]
  [string] $PACKAGE_ID,
  [string] $PATH_AMENDMENT,
  [string] $ALIAS_AMENDMENT
)

#----------------------------------------------------[Setup]------------------------------------------------------------------
#Set Error Action to Stop when fault encountered
$ErrorActionPreference = "Stop"

$ProcessError = $null

#---------------------------------------------------[Script]-------------------------------------------------------------------
Try {
  Write-Output "Using winget to install $PACKAGE_ID..."
  winget install --silent --id $PACKAGE_ID

  # Add the requested directory to the Windows SYSTEM Path
  if($PATH_AMENDMENT){
    Write-Output "Adding $PATH_AMENDMENT to SYSTEM PATH..."
    [Environment]::SetEnvironmentVariable(
        "Path",
        [Environment]::GetEnvironmentVariable("Path",
        [EnvironmentVariableTarget]::Machine) + ";$PATH_AMENDMENT",
        [EnvironmentVariableTarget]::Machine)
  }
  if($ALIAS_AMENDMENT){
    Write-Output "Adding alias $ALIAS_AMENDMENT to %USERPROFILE% PowerShell profile..."
    Add-Content -Path $ENV:UserProfile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Value "Set-Alias $ALIAS_AMENDMENT"
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