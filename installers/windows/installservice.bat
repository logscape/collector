echo
time /T  >> log 
echo "Removing an installed service"  >> log
sc delete LogscapeCloudAgent 
jsl.exe -install >> log 
sc start LogscapeCloudAgent 
