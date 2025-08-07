Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Check Internet Connection"
$form.Size = New-Object System.Drawing.Size(320,150)
$form.StartPosition = "CenterScreen"

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(40,40)
$btn.Size = New-Object System.Drawing.Size(220,40)
$btn.Text = "Check Internet"
$btn.Add_Click({
    $result = Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet
    if ($result) {
        [System.Windows.Forms.MessageBox]::Show("Internet is working!","Status")
    } else {
        [System.Windows.Forms.MessageBox]::Show("No internet connection detected.","Status")
    }
})

$form.Controls.Add($btn)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
