### It works but is super slow as it goes through every single number in every range

$InputArray = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 2\Part 2\input.txt")
$InputArray = @(get-content $Path -Delimiter ",")
$InvalidNumberArray = @()
$InvalidNumberSum = 0

foreach ($ID in $InputArray) {
    $RangeStart = [Long]$ID.Split("-")[0]
    $RangeEnd = [Long]$ID.Split("-")[1]

    for ($Number = $RangeStart; $Number -le $RangeEnd; $Number++) {
        $NumberString = [string]$Number
        $NSLength = $NumberString.Length
        Write-Host "Checking patterns in range $RangeStart-$RangeEnd for number: $Number" -ForegroundColor Green

        for ($i = 1; $i -le $NSLength / 2; $i++) {
            $Pattern = $NumberString.Substring(0, $i)
            $PatternLength = $Pattern.Length
            $PatternsPerString = $NSLength / $PatternLength
            $PatternCount = ($NumberString | Select-String -Pattern $Pattern -AllMatches).Matches.Count
            if ($PatternCount -eq $PatternsPerString) {
                #Write-Host "Matching Pattern: $Pattern" -ForegroundColor Green
                #Write-Host "The range $RangeStart-$RangeEnd has: invalid ID: $Number"
                $InvalidNumberArray += $Number
                break
            }
        }
    }
}
$InvalidNumberArray = $InvalidNumberArray | Sort-Object -Unique
foreach ($InvalidNumber in $InvalidNumberArray) {
    $InvalidNumberSum += $InvalidNumber
}

"Adding up all the invalid IDs gives the sum: $InvalidNumberSum"

