Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Installed Programs"
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,10)
$listBox.Size = New-Object System.Drawing.Size(560,320)
$form.Controls.Add($listBox)

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(200,340)
$btn.Size = New-Object System.Drawing.Size(180,40)
$btn.Text = "Load Installed Programs"
$btn.Add_Click({
    $listBox.Items.Clear()
    $programs = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Select-Object -ExpandProperty DisplayName
    $programs += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Select-Object -ExpandProperty DisplayName
    $programs = $programs | Where-Object { $_ } | Sort-Object
    foreach ($prog in $programs) { $listBox.Items.Add($prog) }
})

$form.Controls.Add($btn)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog
