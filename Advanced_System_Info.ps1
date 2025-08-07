Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Advanced System Info"
$form.Size = New-Object System.Drawing.Size(600,420)
$form.StartPosition = "CenterScreen"

$txt = New-Object System.Windows.Forms.TextBox
$txt.Multiline = $true
$txt.ScrollBars = "Vertical"
$txt.ReadOnly = $true
$txt.Location = New-Object System.Drawing.Point(10,10)
$txt.Size = New-Object System.Drawing.Size(560,320)
$form.Controls.Add($txt)

$btnInfo = New-Object System.Windows.Forms.Button
$btnInfo.Location = New-Object System.Drawing.Point(10,340)
$btnInfo.Size = New-Object System.Drawing.Size(170,40)
$btnInfo.Text = "Show System Info"
$btnInfo.Add_Click({
    $cpu = (Get-CimInstance Win32_Processor).Name
    $ram = "{0:N2} GB" -f ((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB)
    $os = (Get-CimInstance Win32_OperatingSystem).Caption
    $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    $uptime = (Get-Date) - $boot
    $disk = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | 
        ForEach-Object { "$($_.DeviceID): $([math]::Round($_.FreeSpace/1GB,2)) GB free of $([math]::Round($_.Size/1GB,2)) GB" } | Out-String
    $ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -notlike "169.*" }).IPAddress -join ", "
    $txt.Text = "OS: $os`r`nCPU: $cpu`r`nRAM: $ram`r`nUptime: $($uptime.Days) days, $($uptime.Hours) hr, $($uptime.Minutes) min`r`nIP: $ip`r`nDisks:`r`n$disk"
})

$form.Controls.Add($btnInfo)

$btnExport = New-Object System.Windows.Forms.Button
$btnExport.Location = New-Object System.Drawing.Point(200,340)
$btnExport.Size = New-Object System.Drawing.Size(170,40)
$btnExport.Text = "Export Info to File"
$btnExport.Add_Click({
    $file = "$env:USERPROFILE\Desktop\SystemInfo.txt"
    Set-Content -Path $file -Value $txt.Text
    [System.Windows.Forms.MessageBox]::Show("Saved to $file")
})

$form.Controls.Add($btnExport)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
