Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Show My IP Address"
$form.Size = New-Object System.Drawing.Size(320,150)
$form.StartPosition = "CenterScreen"

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(40,40)
$btn.Size = New-Object System.Drawing.Size(220,40)
$btn.Text = "Show My IP"
$btn.Add_Click({
    $ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -notlike "169.*" }).IPAddress -join ", "
    [System.Windows.Forms.MessageBox]::Show("Your IP Address: $ip","IP Address")
})

$form.Controls.Add($btn)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
