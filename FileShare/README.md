 net use shared directory with credentials, this works for Azure Files as well
 
1. open a powershell session that has azure powershell module loaded
2. create a azure automation credential asset.

`New-AzureRmAutomationCredential -name cred -value blah`

3. create config data
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
