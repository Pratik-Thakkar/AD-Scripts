#AddUsers From List
$arr = Import-Csv -Path usersToAdd.csv
$initialPassword = ""
$pscred = Get-Credential

#Gathering AD Group Objects"
#
$groupDA01 = Get-AdGroup "Domain Admins"
$groupDA02 = Get-AdGroup "dbadmin"
$groupWSA = Get-AdGroup "WorksiteSysAdmins"
$groupHO = Get-AdGroup "HostingOps"

foreach($user in $arr)
{
    #echo $user.username
    #echo $user.fullname

    $username = $user.username
    $fullname = $user.fullname
    $firstname = $user.firstname
    $lastname = $user.lastname
    $newUser = New-ADUser -SamAccountName $username -Name $fullname -DisplayName $fullname -GivenName $firstname -Surname $lastname -Enable $true -AccountPassword (ConvertTo-SecureString -AsPlainText "$initialPassword" -Force) -Credential $pscred -Path "OU=,OU=,DC=,DC=,DC=,DC="
    echo "Adding $username - $fullname"
    echo "Adding to Groups"
    Add-ADGroupMember $groupDA01 -Member $newUser
    Add-AdGroupMember $groupDA02 -Member $newUser
    Add-ADGroupMember $groupWSA -Member $newUser
    Add-ADGroupMember $groupHO -Member $newUser

}
