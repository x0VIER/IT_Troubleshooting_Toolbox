Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "List Local Users"
$form.Size = New-Object System.Drawing.Size(500,320)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,20)
$listBox.Size = New-Object System.Drawing.Size(440,200)
$form.Controls.Add($listBox)

$btnList = New-Object System.Windows.Forms.Button
$btnList.Location = New-Object System.Drawing.Point(150,240)
$btnList.Size = New-Object System.Drawing.Size(180,40)
$btnList.Text = "Show Local Users"
$btnList.Add_Click({
    $listBox.Items.Clear()
    try {
        $users = Get-LocalUser
        foreach ($u in $users) {
            $listBox.Items.Add("$($u.Name) — $($u.Enabled)")
        }
    } catch {
        $listBox.Items.Add("Error: Insufficient permissions or unavailable cmdlet.")
    }
})

$form.Controls.Add($btnList)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
