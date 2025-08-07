Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Restart Print Spooler"
$form.Size = New-Object System.Drawing.Size(320,150)
$form.StartPosition = "CenterScreen"

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(40,40)
$btn.Size = New-Object System.Drawing.Size(220,40)
$btn.Text = "Restart Print Spooler"
$btn.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("This would restart the print spooler service!")
})

$form.Controls.Add($btn)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
