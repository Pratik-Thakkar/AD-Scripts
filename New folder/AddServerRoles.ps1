$ServerFeatures = Import-Clixml \\sgdc01\DevOps\ServerFeatures_IDX.xml
foreach ($feature in $ServerFeatures) {Install-WindowsFeature -Name $feature.name}