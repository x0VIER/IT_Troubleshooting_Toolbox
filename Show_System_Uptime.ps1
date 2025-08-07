Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Show System Uptime"
$form.Size = New-Object System.Drawing.Size(320,150)
$form.StartPosition = "CenterScreen"

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(40,40)
$btn.Size = New-Object System.Drawing.Size(220,40)
$btn.Text = "Show Uptime"
$btn.Add_Click({
    $uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    $now = Get-Date
    $diff = $now - $uptime
    $msg = "Uptime: $($diff.Days) days, $($diff.Hours) hours, $($diff.Minutes) minutes"
    [System.Windows.Forms.MessageBox]::Show($msg,"System Uptime")
})

$form.Controls.Add($btn)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
