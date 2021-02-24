$currentVersionString = (Get-Content ..\package.json) -join "`n" | ConvertFrom-Json | Select -ExpandProperty "version"

#$package =  Get-Content '..\package.json' -raw | ConvertFrom-Json

#$currentVersionString = $package.version
Write-Host $currentVersionString
$currentVersion =[version] ($currentVersionString.split("-"))[0]
# Incrementing the minor version

$newMinorVersion = $currentVersion.Minor +1

$newVersion = "{0}.{1}.0-preview" -f $currentVersion.Major, $newMinorVersion

npm version $newVersion
# $package.update | % { $package.version = $newVersion }
# $package | ConvertTo-Json  | set-content '..\package.json'
