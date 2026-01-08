$BatteryBanks = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 3\Part 1\inputexampl.txt")
$BatteryBanks = get-content $Path
$JoltageSum = 0

foreach ($Bank in $BatteryBanks) {
    $BankDigitArray = $Bank.ToCharArray() 
    $FirstDigit = 0
    $SecondDigit = 0
    "Current bank: $Bank"
    for ($i = 0; $i -lt $BankDigitArray.Length; $i++) {
        
        #"Current i: $i"
        #"Current digit: $($BankDigitArray[$i])"
        if ($BankDigitArray[$i] -gt $FirstDigit -and $i -lt ($BankDigitArray.Length - 1)) {
            $FirstDigit = $BankDigitArray[$i]
            $SecondDigit = 0
        }
        
        elseif ($BankDigitArray[$i] -gt $SecondDigit) {
            $SecondDigit = $BankDigitArray[$i]
        }
        
    }
    [int]$Joltage = [String]::Concat($FirstDigit, $SecondDigit)
    $JoltageSum += $Joltage
    "First digit: $FirstDigit - Second digit: $SecondDigit"
    "Joltage: $Joltage"
}
"#####"
"Joltage sum: $JoltageSum"

