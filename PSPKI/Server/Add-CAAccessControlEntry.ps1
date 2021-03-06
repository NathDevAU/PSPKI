function Add-CAAccessControlEntry {
<#
.ExternalHelp PSPKI.Help.xml
#>
[CmdletBinding()]
	param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[Alias('ACL')]
		[PKI.Security.AccessControl.CASecurityDescriptor[]]$InputObject,
		[Alias('ACE')]
		[PKI.Security.AccessControl.CertificationAuthorityAccessRule[]]$AccessControlEntry
	)
	process {
		foreach($ACL in $InputObject) {
			$AccessControlEntry | ForEach-Object {
				[void]$ACL.AddAccessRule($_)
			}
			$ACL
		}
	}
}