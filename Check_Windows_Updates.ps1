Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "Check Windows Updates"
$form.Size = New-Object System.Drawing.Size(500,320)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,20)
$listBox.Size = New-Object System.Drawing.Size(440,200)
$form.Controls.Add($listBox)

$btnCheck = New-Object System.Windows.Forms.Button
$btnCheck.Location = New-Object System.Drawing.Point(150,240)
$btnCheck.Size = New-Object System.Drawing.Size(180,40)
$btnCheck.Text = "Check for Updates"
$btnCheck.Add_Click({
    $listBox.Items.Clear()
    try {
        $updates = (New-Object -ComObject Microsoft.Update.Session).CreateUpdateSearcher().Search("IsInstalled=0").Updates
        if ($updates.Count -eq 0) {
            $listBox.Items.Add("No pending updates!")
        } else {
            foreach ($u in $updates) {
                $listBox.Items.Add($u.Title)
            }
        }
    } catch {
        $listBox.Items.Add("Error: Windows Update service not available or insufficient permissions.")
    }
})

$form.Controls.Add($btnCheck)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$foCheck_Windows_Updates.ps1rm.ShowDialog()Check_Windows_Updates.ps1
Check_Windows_Updates.ps1