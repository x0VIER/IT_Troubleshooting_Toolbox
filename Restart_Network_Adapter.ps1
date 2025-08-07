Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Restart Network Adapter Tool"
$form.Size = New-Object System.Drawing.Size(320,180)
$form.StartPosition = "CenterScreen"

$btnRestartNet = New-Object System.Windows.Forms.Button
$btnRestartNet.Location = New-Object System.Drawing.Point(25,40)
$btnRestartNet.Size = New-Object System.Drawing.Size(250,40)
$btnRestartNet.Text = "Restart Network Adapter"
$btnRestartNet.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("This would restart the network adapter.")
})

$form.Controls.Add($btnRestartNet)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
