Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.Text = "Recently Modified Files"
$form.Size = New-Object System.Drawing.Size(650,440)
$form.StartPosition = "CenterScreen"

$lbl = New-Object System.Windows.Forms.Label
$lbl.Text = "Folder to search:"
$lbl.Location = New-Object System.Drawing.Point(15,15)
$lbl.AutoSize = $true
$form.Controls.Add($lbl)

$txtPath = New-Object System.Windows.Forms.TextBox
$txtPath.Size = New-Object System.Drawing.Size(400,25)
$txtPath.Location = New-Object System.Drawing.Point(115,12)
$txtPath.Text = "$env:USERPROFILE\Documents"
$form.Controls.Add($txtPath)

$btnBrowse = New-Object System.Windows.Forms.Button
$btnBrowse.Location = New-Object System.Drawing.Point(530,10)
$btnBrowse.Size = New-Object System.Drawing.Size(90,25)
$btnBrowse.Text = "Browse"
$btnBrowse.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $txtPath.Text = $dialog.SelectedPath
    }
})
$form.Controls.Add($btnBrowse)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(15,50)
$listBox.Size = New-Object System.Drawing.Size(605,310)
$form.Controls.Add($listBox)

$btnFind = New-Object System.Windows.Forms.Button
$btnFind.Location = New-Object System.Drawing.Point(250,370)
$btnFind.Size = New-Object System.Drawing.Size(180,40)
$btnFind.Text = "Show Recent Files"
$btnFind.Add_Click({
    $listBox.Items.Clear()
    $folder = $txtPath.Text
    if (-not (Test-Path $folder)) {
        [System.Windows.Forms.MessageBox]::Show("Folder not found!")
        return
    }
    $since = (Get-Date).AddHours(-48)
    $files = Get-ChildItem -Path $folder -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -gt $since } | Sort-Object LastWriteTime -Descending | Select-Object -First 20
    foreach ($file in $files) {
        $listBox.Items.Add("$($file.FullName) — $($file.LastWriteTime)")
    }
    if ($files.Count -eq 0) {
        $listBox.Items.Add("No recent files found.")
    }
})

$form.Controls.Add($btnFind)
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
