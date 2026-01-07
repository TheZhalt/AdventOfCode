$InputArray = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 2\Part 1\input.txt")
$InputArray = @(get-content $Path -Delimiter ",")
$InvalidNumberArray = @()
$InvalidNumberSum = 0

foreach ($ID in $InputArray) {
    #$RangeStart
    #$RangeEnd
    $RangeStart = [Long]$ID.Split("-")[0]
    $RangeEnd = [Long]$ID.Split("-")[1]
    $InvalidCounter = 0
    for ($Number = $RangeStart; $Number -le $RangeEnd; $Number++) {
        $NumberString = [string]$Number
        $mid = $NumberString.Length / 2
        $first = $NumberString.Substring(0, $mid)
        $second = $NumberString.Substring($mid)
        if ($first -eq $second) {
            $InvalidCounter++
            $InvalidNumberArray += $Number
        }
    }
}
foreach ($InvalidNumber in $InvalidNumberArray) {
    $InvalidNumberSum += $InvalidNumber
}

"Adding up all the invalid IDs gives the sum: $InvalidNumberSum"
