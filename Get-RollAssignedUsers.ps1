Connect-PartnerCenter

$users = @()

$roles = Get-PartnerRole

foreach($role in $roles)
{
   $members = Get-PartnerRoleMember -RoleId $role.RoleId

    foreach($member in $members)
    {
        $user = New-Object PSObject | Select-Object PartnerCenterRoleName, DisplayName, UserPrincipalName

        $user.PartnerCenterRoleName = $role.Name
        $user.DisplayName = $member.DisplayName
        $user.UserPrincipalName = $member.UserPrincipalName

        $users += $user
    }
}

$users | ConvertTo-Csv -NoTypeInformation
