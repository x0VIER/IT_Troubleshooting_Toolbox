Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "System Resource Monitor"
$form.Size = New-Object System.Drawing.Size(320,180)
$form.StartPosition = "CenterScreen"

$lblCPU = New-Object System.Windows.Forms.Label
$lblCPU.Text = "CPU Usage: "
$lblCPU.Location = New-Object System.Drawing.Point(30,30)
$lblCPU.Size = New-Object System.Drawing.Size(250,30)
$form.Controls.Add($lblCPU)

$lblRAM = New-Object System.Windows.Forms.Label
$lblRAM.Text = "RAM Usage: "
$lblRAM.Location = New-Object System.Drawing.Point(30,70)
$lblRAM.Size = New-Object System.Drawing.Size(250,30)
$form.Controls.Add($lblRAM)

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
    $ram = (Get-Counter '\Memory\% Committed Bytes In Use').CounterSamples[0].CookedValue
    $lblCPU.Text = "CPU Usage: {0:N1}%" -f $cpu
    $lblRAM.Text = "RAM Usage: {0:N1}%" -f $ram
})
$timer.Start()

$form.FormClosing.Add({ $timer.Stop() })
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
