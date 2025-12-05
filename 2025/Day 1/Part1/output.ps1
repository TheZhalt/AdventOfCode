$TextInput = @()
$TextInput = get-content "C:\Users\JonasWeberNobel\source\repos\AdventOfCode\2025\Day 1\Part1\input.txt"
$ZeroCounter = 0
$DialRange = @(0..99)
$DialLocation = $DialRange[50]
$DialRotation = 0

"Dial starts pointing at $DialLocation"

foreach ($Line in $TextInput) {
    
    $DialRotation = $Line.Replace("L", "-").Replace("R", "+")
    $DialLocation = $DialRange[($DialLocation + $DialRotation) % 100]
    "The dial is rotated $Line to point at $DialLocation"

    if ($DialLocation -eq 0) {
        $ZeroCounter++
    }
}
"Amount of times that the dial pointed to zero: $ZeroCounter"