Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object System.Windows.Forms.Form
$form.Text = "Show Disk Space"
$form.Size = New-Object System.Drawing.Size(500,320)
$form.StartPosition = "CenterScreen"

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,20)
$listBox.Size = New-Object System.Drawing.Size(440,200)
$form.Controls.Add($listBox)

$btnShow = New-Object System.Windows.Forms.Button
$btnShow.Location = New-Object System.Drawing.Point(150,240)
$btnShow.Size = New-Object System.Drawing.Size(180,40)
$btnShow.Text = "Show Disk Space"
$btnShow.Add_Click({
    $listBox.Items.Clear()
    try {
        $drives = Get-PSDrive -PSProvider FileSystem
        foreach ($d in $drives) {
            $free = "{0:N2}" -f ($d.Free/1GB)
            $total = "{0:N2}" -f ($d.Used/1GB + $d.Free/1GB)
            $listBox.Items.Add("$($d.Name): $free GB free
