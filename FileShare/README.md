 net use shared directory with credentials, this works for Azure Files as well
 
# open a powershell session that has azure powershell module loaded
# create a azure automation credential asset.

`New-AzureRmAutomationCredential -name cred -value blah`

# create config data
```
$configData = @{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            PSDscAllowPlainTextPassword = $true
        }
    )
}
```
