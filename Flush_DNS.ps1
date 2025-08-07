Add-Type -AssemblyName System.Windows.Forms  # Loads Windows Forms for GUI
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Flush DNS Tool"
$form.Size = New-Object System.Drawing.Size(300,180)
$form.StartPosition = "CenterScreen"

$btnFlushDNS = New-Object System.Windows.Forms.Button
$btnFlushDNS.Location = New-Object System.Drawing.Point(25,40)
$btnFlushDNS.Size = New-Object System.Drawing.Size(230,40)
$btnFlushDNS.Text = "Flush DNS"
$btnFlushDNS.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("This would flush DNS.")
})

$form.Controls.Add($btnFlushDNS)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
