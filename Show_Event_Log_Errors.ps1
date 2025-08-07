Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "Recent Event Log Errors"
$form.Size = New-Object System.Drawing.Size(700,380)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,20)
$listBox.Size = New-Object System.Drawing.Size(640,250)
$form.Controls.Add($listBox)

$btnCheck = New-Object System.Windows.Forms.Button
$btnCheck.Location = New-Object System.Drawing.Point(260,290)
$btnCheck.Size = New-Object System.Drawing.Size(180,40)
$btnCheck.Text = "Show Last 20 Errors"
$btnCheck.Add_Click({
    $listBox.Items.Clear()
    try {
        $errors = Get-WinEvent -LogName Application -MaxEvents 100 | Where-Object { $_.LevelDisplayName -eq "Error" } | Select-Object -First 20
        foreach ($err in $errors) {
            $listBox.Items.Add("$($err.TimeCreated): $($err.ProviderName) — $($err.Message.Substring(0,[math]::Min(70,$err.Message.Length)))")
        }
        if ($errors.Count -eq 0) {
            $listBox.Items.Add("No recent errors found.")
        }
    } catch {
        $listBox.Items.Add("Error: Unable to read event log.")
    }
})

$form.Controls.Add($btnCheck)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
