#!/bin/bash

#set -x
#Set Username
username="AbdulwadudMohamed"
#Declare arrays
REPONAMES=()
REPOCOMMITS=()

#-H "Authorization: Bearer $TOKEN" \

#Repositories changed to 100 per page instead of 1000
repos=$(curl \
    -H "Authorization: Bearer $TOKEN" \
    -s "https://api.github.com/users/$username/repos?per_page=100")

#Loop through the list of repositories
for repo in $(echo "${repos}" | jq -r '.[] | @base64'); do
    repo_name=$(echo ${repo} | base64 --decode | jq -r '.name')
    repo_desc=$(echo ${repo} | base64 --decode | jq -r '.description')
    commits=$(curl \
    -H "Authorization: Bearer $TOKEN" \
    -s https://api.github.com/repos/$username/$repo_name/commits?per_page=100 | jq '. | length')
    
    #Store data into list
    REPONAMES+=("$repo_name")
    REPOCOMMITS+=("$commits")
    
    #Output
    echo "Collected Data"
    echo "Repo Name: $repo_name" 
    echo "Repo Desc: $repo_desc"
    echo "No of commits: $commits"
done

#Loop through the array and write each element to the file
echo -n > REPONAMES.txt
for repo in "${REPONAMES[@]}"; do
    echo $repo >> REPONAMES.txt
done

echo -n > REPOCOMMITS.txt
for repo in "${REPOCOMMITS[@]}"; do
    echo $repo >> REPOCOMMITS.txt
done


echo "End of Bash script"