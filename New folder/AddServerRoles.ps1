$ServerFeatures = Import-Clixml \\DevOps\ServerFeatures_IDX.xml
foreach ($feature in $ServerFeatures) {Install-WindowsFeature -Name $feature.name}
