[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$formShowmenu = New-Object 'System.Windows.Forms.Form'
$combobox1 = New-Object 'System.Windows.Forms.ComboBox'


$combobox1_SelectedIndexChanged = {
$script:var = $combobox1.SelectedItem
$formShowmenu.Close()
}


$formShowmenu.Controls.Add($combobox1)
$formShowmenu.AutoScaleDimensions = '6, 13'
$formShowmenu.AutoScaleMode = 'Font'
$formShowmenu.ClientSize = '284, 70'

#add array of items
[void]$combobox1.Items.Addrange(1 .. 10)

#add single item
#[void]$combobox1.Items.Add('Single Item')

$combobox1.Location = '45, 25'
$combobox1.Size = '187, 21'
$combobox1.add_SelectedIndexChanged($combobox1_SelectedIndexChanged)

$formShowmenu.ShowDialog() | out-null

write-output $var
}