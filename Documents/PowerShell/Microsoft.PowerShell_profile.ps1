oh-my-posh init pwsh --config ~/.oh-my-posh.config.json | Invoke-Expression
$env:CHROME_EXECUTABLE="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

Function ExportStartLayout { Export-StartLayout -Path "$HOME\GetIDorPath.xml" }

New-Alias Export-StartMenuLinks ExportStartLayout