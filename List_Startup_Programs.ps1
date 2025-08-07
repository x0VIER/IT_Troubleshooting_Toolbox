Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "List Startup Programs"
$form.Size = New-Object System.Drawing.Size(600,350)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,20)
$listBox.Size = New-Object System.Drawing.Size(540,220)
$form.Controls.Add($listBox)

$btnList = New-Object System.Windows.Forms.Button
$btnList.Location = New-Object System.Drawing.Point(200,260)
$btnList.Size = New-Object System.Drawing.Size(180,40)
$btnList.Text = "Show Startup Programs"
$btnList.Add_Click({
    $listBox.Items.Clear()
    try {
        $runKeys = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run","HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
        foreach ($key in $runKeys) {
            if (Test-Path $key) {
                Get-ItemProperty $key | ForEach-Object {
                    $_.PSObject.Properties | Where-Object { $_.Name -ne "PSPath" -and $_.Name -ne "PSParentPath" -and $_.Name -ne "PSChildName" -and $_.Name -ne "PSDrive" -and $_.Name -ne "PSProvider" } | ForEach-Object {
                        $listBox.Items.Add("$($_.Name): $($_.Value)")
                    }
                }
            }
        }
    } catch {
        $listBox.Items.Add("Error: Unable to read startup entries.")
    }
})

$form.Controls.Add($btnList)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
