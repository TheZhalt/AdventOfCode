$BatteryBanks = @()
$GetLocation = Get-Location
$Path = -join ($GetLocation, "\2025\Day 3\Part 2\input.txt")
$BatteryBanks = get-content $Path
$JoltageSum = $null
$TargetBatteries = 12


foreach ($Bank in $BatteryBanks) {
    $BatteriesInBank = $Bank.ToString().Length
    $BankDigitArray = $Bank.ToCharArray() 
    "Current bank: $Bank"
    $Removals = [Math]::Abs($TargetBatteries - $BatteriesInBank)
    
    #$ArrayLenght = 
    while ($Removals -gt 0) {
        $Joltage = $null
        for ($i = 0; $i -lt $BankDigitArray.Length; $i++) {
            if ($BankDigitArray[$i] -le $BankDigitArray[$i + 1]) {
                if ($Removals -gt 0) {
                    #$BankDigitArray[$i]
                    #"Removals: $Removals"
                    #Write-Host "Removed digit: $($BankDigitArray[$i])" -ForegroundColor Red
                    #$BankDigitArray.Length
                    #$BankDigitArray = $BankDigitArray - $BankDigitArray[$i]
                    $BankDigitArray[$i] = $null
                    $Removals--
                    Continue
                }
            }
            [BigInt]$Joltage = [String]::Concat($Joltage, $BankDigitArray[$i])
            

        }
        $BankDigitArray = $Joltage.ToString().ToCharArray()
    }    
    "Joltage: $Joltage"
    "Joltage length: $($Joltage.ToString().Length)"
    $JoltageSum += $Joltage
    #"First digit: $FirstDigit - Second digit: $SecondDigit"
    #"Joltage: $Joltage"
    #$Joltage
    #
}
"#####"
"Joltage sum: $JoltageSum"



