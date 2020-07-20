Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Web
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object system.Windows.Forms.Form
$Base64IMG = "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABmJLR0QA/wD/AP+gvaeTAAACRklEQVRYhe3Vu08UURQG8B+oJD4KnkZMpLNWE2JnjFEKDRba+AdogZVEUAiNFBa0xPhoDLEysdTEQiNC1M4QG2NipyVBCg2g8liLPZMdltnZZX01fMnNnXu+c8/55p47Z9jCFv4zGirY38V4iWl0YRjd2BVcBw6E/2fM4TAW8RZjYT+OEziEI7UKm0LhD4/JWpPDWaylNn/HIDpjDOBHiv+JkRR/LfYk/Bp6NyMALmEpAgxm8P2pBP0Z/PXgFnFxs8kTzEeQzli/wat4bkkJaMng9wc3n5egsYqA7WXrpCywM2XfkcGvxbytSo5cTEbAkQxuSOkErmbwI8G9+B0BryPIMq6gWfFoh2y8hINoC5/+2FNQKkld+KL651VtzNWbfA9WI0gPnmIWXzGTkWgmuNnw7Qn7asTaNO6mgo9gXxk/muJHy7h26+/Inc0m77G+ERUUa/4QB8tEpJN3YUKpf6Qb0alakzfgg1KD6ca44vEmXXHAxv9IHxbCZwG3cVSpYb3P2JOJM7HhI5pS9nbcUzqZ+4rfeANupd72gfXlaopYBZyuRcDzcO6rwPfiW/iM4UY8L+FChT2Xw+dZteRtird2Sam9ZuGY4p1YC/9lxXtTCS0RcxWteQLOh9LHZfaJsE+kbMmbF3Czii88Cfu5PAFJLYfL7LvxKOYEnSkBnVV8KbXm8TwB0+F0Is+pTpyM2FNpY/nfcG/Mn/6CgCRmR57TnKLK5lhn1bNeW2usZ/MErIRTcjJZ9azX1hixV/IEbGEL/xy/ACH351AClCkbAAAAAElFTkSuQmCC"
#$Base64IMG = "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"
$iconBytes       = [Convert]::FromBase64String($Base64IMG)
$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)
$Form.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())


$Form.Height = 200
$Form.Width = 300
$folder = ""
$myError = ""
    Function Get-Folder()
    {
        [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
        $OpenFileDialog = New-Object System.Windows.Forms.FolderBrowserDialog
        [void]$OpenFileDialog.ShowDialog()
        #$Form.Text = $OpenFileDialog.SelectedPath
        cd $OpenFileDialog.SelectedPath
        $FolderInfo.Text = "Search Directory" + "`r`n" + $OpenFileDialog.SelectedPath
        $global:folder = $OpenFileDialog.SelectedPath

    }

Function generate-Page(){
    
    $name = $global:textBox.Text
    $format = $global:textBox1.Text.Trim(".")
    

    $scriptblock = {
        param ($name,$format,$Filepath,$FolderInfo)
        Add-Type -AssemblyName System.Web
        Add-Type -AssemblyName System.Windows.Forms
        $array = @()

        $FolderInfo.Text = "test"

        Get-ChildItem $Filepath -recurse *$name*.*$format* | % {
            $object = New-Object -TypeName psobject
    
            $object | Add-member -MemberType NoteProperty -name "last write" -Value  ($_.LastWriteTime)
            $link = "<a href='file:///$($_.Directory)/$($_.name)'>$($_.name)</a>"
            $object | Add-member -MemberType NoteProperty -name name -Value ($link)
            $filepath = "<a target='_blank' href='file:///$($_.Directory)'>$($_.Directory)</a>"
            $object | Add-member -MemberType NoteProperty -name Directory -Value ($filepath)
            $array += $object
            

            
        }
        
        $html = $array | convertto-html -CssUri "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        $html = $html.replace("<table>","<table class='table table-striped table-hover table-condensed'>")
        $html = $html.replace("<body>","<body><h1 class='heading'> Search for $name . $format </h1>")
        $html = [System.Web.HttpUtility]::HtmlDecode($html) | out-file "C:\Users\Butterfingers\Desktop\outfile.html"
        
        
        start "C:\Users\Butterfingers\Desktop\outfile.html"
    }
    $job = start-job -scriptblock $scriptblock -ArgumentList $name,$format,$folder,$FolderInfo -Name "Test"

}

$FolderButton = New-Object System.Windows.Forms.Button 
$FolderButton.Location = New-Object System.Drawing.Size(10,50) 
$FolderButton.Size = New-Object System.Drawing.Size(100,30) 
$FolderButton.Text = "Select Folder" 
$FolderButton.Add_Click({
    Get-Folder
    $FolderInfo.ForeColor ='Black'
    $Form.text = $global:folder

}) 



$Okbutton = New-Object System.Windows.Forms.Button 
$Okbutton.Location = New-Object System.Drawing.Size(211,50) 
$Okbutton.Size = New-Object System.Drawing.Size(50,30) 
$Okbutton.Text = "Search" 
$Okbutton.Add_Click({
    $Form.Text = $folder
    $myError = ""
    if($textBox.text.Trim().Trim("*") -ne "" -or $textBox1.text.Trim().Trim("*") -ne ""){
        
        if($folder -eq ""){
            $myError = "Please select a search directory"
        }else{
            generate-Page
        }
        
    }else{
        $myError = "Please enter file name or extension"
        $FolderInfo.Text = $myError
    }
    if($myError -ne ""){
        $FolderInfo.ForeColor = "Red"
        $FolderInfo.Text = $myError
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
