#### NOT GIVING CORRECT RESULT ####

$TextInput = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 1\Part 2\input.txt")
$TextInput = get-content $Path
$ZeroCounter = 0
$DialRange = @(0..99)
$DialLocation = $DialRange[50]
#$DialLocation = 0
$DialRotation = 0

"Dial starts pointing at $DialLocation"

foreach ($Line in $TextInput) {
    
    $FullRotations = 0
    $DialRotation = $Line.Replace("L", "-").Replace("R", "")
    "DialLocation: $DialLocation"
    "DialRotation: $DialRotation"
    $FullRotations = ($DialLocation + $DialRotation) / $DialRange.Length
    "Full rotations: $FullRotations"
    if ($FullRotations -le -1) {
        "Test-1"
        $FullRotations = [math]::Abs([math]::Ceiling(($FullRotations)))
    }
    elseif ($FullRotations -lt 0) {
        "Test-2"
        if ($DialLocation -ne 0) {
            $FullRotations = [math]::Abs([math]::Floor(($FullRotations)))
        }
    }

    $DialLocation = $DialRange[($DialLocation + $DialRotation) % 100]

    if ($FullRotations -eq 0) {
        $ZeroCounter++
    }
    "Full rotations: $FullRotations"
    if ($FullRotations -gt 0) {
        "Test-3"
        $FullRotations = [math]::Floor($FullRotations)
        if ($DialLocation -eq 0) {
            "Test-3-5"
            #$FullRotations++
            if ($DialRotation -lt 0 -and $FullRotations -eq 1) {
                "Test-3-5-1"
                $FullRotations++
            }
            #if ($DialRotation -gt 0 -and $FullRotations -gt 1) {
            #    "Test-3-5-3"
            #    $FullRotations--
            #}
        }
        "The dial is rotated $Line to point at $DialLocation and went to zero, $FullRotations time(s)"
        $ZeroCounter += $FullRotations
        
    }
    else {
        "The dial is rotated $Line to point at $DialLocation"
    }

    "Zero counter: $ZeroCounter"

    
    #$FullRotations

}
"Amount of times that the dial passed or ended on zero: $ZeroCounter `n"


#
######
#$DialLocation = 0
#$FullRotations = -5
#"Full rotations: $FullRotations"
#if ($FullRotations -le -1) {
#    $FullRotations = [math]::Abs([math]::Ceiling(($FullRotations)))
#}
#"Full rotations: $FullRotations"