Add-Type -AssemblyName System.Windows.Forms  # Loads Windows Forms for GUI
[System.Windows.Forms.Application]::EnableVisualStyles()  # Modern look

$form = New-Object system.Windows.Forms.Form
$form.Text = "IT Troubleshooting Toolbox"
$form.Size = New-Object System.Drawing.Size(350,350)
$form.StartPosition = "CenterScreen"

# Example Button: Flush DNS
$btnFlushDNS = New-Object System.Windows.Forms.Button
$btnFlushDNS.Location = New-Object System.Drawing.Point(40,40)
$btnFlushDNS.Size = New-Object System.Drawing.Size(250,40)
$btnFlushDNS.Text = "Flush DNS"
$btnFlushDNS.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("This would flush DNS.")
})

$form.Controls.Add($btnFlushDNS)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
