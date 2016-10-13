# net use shared directory with credentials, this works for Azure Files as well
# open a powershell session that has azure powershell module loaded
# create a azure automation credential asset.
# New-AzureRmAutomationCredential -name cred -value blah
# create config data
# $configData = @{
#    AllNodes = @(
#        @{
#            NodeName = 'localhost'
#            PSDscAllowPlainTextPassword = $true
#        }
#    )
#}

#Start-AzureRmAutomationDscCompilationJob -ConfigurationName "Set-FileShare" -ConfigurationData $ConfigData -Parameters @{storageCred="blah"}
Configuration UseFileShare
{
    param( 
        [Parameter(Mandatory=$true)][PSCredential]$storageCred,
        [Parameter(Mandatory=$true)][string]$sourePath,
        $sharePath="C:\SharedFiles" 
    )

    node localhost
    {
        File Binaries
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"            
            Type = "Directory" # Default is "File".
            Credential = $stroageCred
            Recurse = $true # Ensure presence of subdirectories, too
            SourcePath = $sourePath
            DestinationPath = $sharePath    
        }
    }
 } 