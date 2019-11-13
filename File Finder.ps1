Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Web

$Form = New-Object system.Windows.Forms.Form
$Form.Height = 200
$Form.Width = 300
$folder = ""
    Function Get-Folder()
    {
        [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
        $OpenFileDialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $folder = ""
        [void]$OpenFileDialog.ShowDialog()
        #$Form.Text = $OpenFileDialog.SelectedPath
        cd $OpenFileDialog.SelectedPath
        $FolderInfo.Text = "Search Directory" + "`r`n" + $OpenFileDialog.SelectedPath

    }

Function generate-Page(){
    $name = $textBox.Text
    $format = $textBox1.Text
    $array = @()
    Get-ChildItem -recurse *$name*.*$format* | % {
        $object = New-Object -TypeName psobject
    
        $object | Add-member -MemberType NoteProperty -name "last write" -Value  ($_.LastWriteTime)
        $object | Add-member -MemberType NoteProperty -name name -Value ($_.name)
        $filepath = "<a href='file:///$($_.Directory)'>$($_.Directory)</a>"
        $object | Add-member -MemberType NoteProperty -name Directory -Value ($filepath)
     
        $array += $object
    }
    $logo = "<img src='https://www.hsdirect.co.uk/images/NEW_HS_Logo_200_55.png'/>"
    $html = $array | convertto-html -CssUri "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    $html = $html.replace("<table>","<table class='table table-striped table-hover table-condensed'>")
    $html = $html.replace("<body>","<body><h1 class='heading'>$logo Search for $name </h1>")
    [System.Web.HttpUtility]::HtmlDecode($html) | out-file .\outfile.html | start .\outfile.html
    
}

$FolderButton = New-Object System.Windows.Forms.Button 
$FolderButton.Location = New-Object System.Drawing.Size(10,50) 
$FolderButton.Size = New-Object System.Drawing.Size(100,30) 
$FolderButton.Text = "Select Folder" 
$FolderButton.Add_Click({
    $folder = Get-Folder
}) 

$Okbutton = New-Object System.Windows.Forms.Button 
$Okbutton.Location = New-Object System.Drawing.Size(211,50) 
$Okbutton.Size = New-Object System.Drawing.Size(50,30) 
$Okbutton.Text = "Search" 
$Okbutton.Add_Click({
    if($textBox.text.Trim().Trim("*") -ne ""){
        generate-Page
    }
}) 

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,20)
$textBox.Size = New-Object System.Drawing.Size(200,20)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(218,20)
$textBox1.Size = New-Object System.Drawing.Size(42,20)

$FileLabel = New-Object System.Windows.Forms.Label
$FileLabel.Location = New-Object System.Drawing.Point(10,5)
$FileLabel.Size = New-Object System.Drawing.Size(200,15)
$FileLabel.Text = "FileName"

$extLabel = New-Object System.Windows.Forms.Label
$extLabel.Location = New-Object System.Drawing.Point(217,5)
$extLabel.Size = New-Object System.Drawing.Size(30,15)
$extLabel.Text = "ext"

$FolderInfo = New-Object System.Windows.Forms.Label
$FolderInfo.Location = New-Object System.Drawing.Point(10,90)
$FolderInfo.Size = New-Object System.Drawing.Size(250,50)
$FolderInfo.Text = "Search Directory"
$FolderInfo.BackColor = "DarkGray"

$textBox1.AcceptsReturn = $true

$form.Controls.Add($FolderInfo)
$form.Controls.Add($extLabel)
$form.Controls.Add($FileLabel)
$form.Controls.Add($textBox1)
$form.Controls.Add($textBox)
$Form.Controls.Add($FolderButton)
$Form.Controls.Add($Okbutton)

$Form.MaximumSize = $Form.Size
$Form.MinimumSize = $Form.Size


$Form.ShowDialog()