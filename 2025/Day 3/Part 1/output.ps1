$TextInput = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 3\Part 1\inputexample.txt")
$TextInput = get-content $Path
$TextInput