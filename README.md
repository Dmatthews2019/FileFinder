# FileFinder
Find files by part of file name with optional file extension.

Usefull tool if you want to query a folder on your machine or network drive.
It takes input from the user and surrounds it with wildcards so you can search for only part of the name.

The main function of the script is really just powershells get-childitem -recurse and then pipes it to
Convertto-html.

We just provide a GUI and tidy up the output abit to make it more friendly.

Recommend not searching Searching the entire C:\ or other root folders as it may take a while but nothing stopping you.
a filter in the file name is allways required
this may be changed by going to line 56

replace
    if($textBox.text.Trim().Trim("*") -ne ""){
        generate-Page
    }
with
    generate-Page
    
essentially just remove the condition statement

