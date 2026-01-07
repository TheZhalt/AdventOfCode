$InputArray = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 2\Part 2\inputexample.txt")
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
        $NSLength = $NumberString.Length
        
        for ($i = 1; $i -le $NSLength / 2; $i++) {
            
            if ($NSLength % $i -eq 0) {
                $Pattern = $NumberString.Substring(0, $i)

                # Construct the string by repeating pattern
                $Times = $NSLength / $i
                $CheckString = ""
                for ($k = 0; $k -lt $Times; $k++) {
                    $CheckString += $Pattern
                }
                
                if ($CheckString -eq $NumberString) {
                    Write-Host "The range $RangeStart-$RangeEnd has: invalid ID: $Number" -ForegroundColor Red
                    $InvalidCounter++
                    $InvalidNumberArray += $Number
                    break
                }
            }
        }


        #$mid = $NumberString.Length / 2
        #$first = $NumberString.Substring(0, $mid)
        #$second = $NumberString.Substring($mid)
        #if ($first -eq $second) {
        #    $InvalidCounter++
        #    $InvalidNumberArray += $Number
        #}
    }
}
foreach ($InvalidNumber in $InvalidNumberArray) {
    $InvalidNumberSum += $InvalidNumber
}

"Adding up all the invalid IDs gives the sum: $InvalidNumberSum"

