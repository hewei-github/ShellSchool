# Modify [CmdletBinding()] to [CmdletBinding(SupportsShouldProcess=$true)]
# 中文注释
$paths = @()
foreach ($aPath in $Path) {
      if (!(Test-Path -LiteralPath $aPath)) {
            $ex = New-Object System.Management.Automation.ItemNotFoundException "Cannot find path '$aPath' because it does not exist."
            $category = [System.Management.Automation.ErrorCategory]::ObjectNotFound
            $errRecord = New-Object System.Management.Automation.ErrorRecord $ex,'PathNotFound',$category,$aPath
            $psCmdlet.WriteError($errRecord)
            continue
      }

      # Resolve any relative paths
      $paths += $psCmdlet.SessionState.Path.GetUnresolvedProviderPathFromPSPath($aPath)
}

foreach ($aPath in $paths) {
      if ($pscmdlet.ShouldProcess($aPath, 'Operation')) {
            # Process each path
      }
}
echo $env:Path