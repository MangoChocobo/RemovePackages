Write-Host "Please look up the package name that you are trying to get rid of first using Get-AppxPackage"

$Repeat = $True
While($Repeat)
{
    $Package = Read-Host "Input the package you want to remove"
    $ConfirmChoice = Read-Host "Are you sure you this is what you want to remove? 'y' or 'n'"
    switch($ConfirmChoice)
    {
        y{
            $Choice = Get-AppxPackage | Select PackageFullName | Select-String $Package
            $Choice = $Choice -replace "@{PackageFullName=", "" -replace "}", "" 
            Remove-AppxPackage $Choice

            Write-Host "$Package has been removed!"

            $Answer = Read-Host 'Want to do another one? "Yes" "No"'
        }

        n{
            $Answer = Read-Host "Want to do another one? 'Yes' 'No'"
        }
    }
    if($Answer -eq "No" -or "n" -or "NO" -or "N")
    {
            $Repeat = $False
    }
}

