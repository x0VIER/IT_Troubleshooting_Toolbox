Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "Firewall Quick Toggle"
$form.Size = New-Object System.Drawing.Size(340,180)
$form.StartPosition = "CenterScreen"

$btnEnable = New-Object System.Windows.Forms.Button
$btnEnable.Location = New-Object System.Drawing.Point(40,40)
$btnEnable.Size = New-Object System.Drawing.Size(110,40)
$btnEnable.Text = "Enable Firewall"
$btnEnable.Add_Click({
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    [System.Windows.Forms.MessageBox]::Show("Firewall enabled on all profiles!")
})

$btnDisable = New-Object System.Windows.Forms.Button
$btnDisable.Location = New-Object System.Drawing.Point(180,40)
$btnDisable.Size = New-Object System.Drawing.Size(110,40)
$btnDisable.Text = "Disable Firewall"
$btnDisable.Add_Click({
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
    [System.Windows.Forms.MessageBox]::Show("Firewall disabled on all profiles!")
})

$form.Controls.Add($btnEnable)
$form.Controls.Add($btnDisable)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
