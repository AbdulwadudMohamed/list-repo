#!/bin/sh

#Get Github Username
GETUSERNAME() {
    echo "Enter GitHub Username (Case sensitive)"
    read username
    VERIFYUSERNAME username
}

#Verify username
VERIFYUSERNAME() {
read -p "Is your username: $username?" yn
    case $yn in 
        [Yy]* ) echo "SUCCESS";;
        [Nn]* ) echo "Wrong Details Recorded"GETUSERNAME;; 
        *) echo "Please answer yes or no.";;
        esac
}

GETUSERNAME

#Use the GitHub API to get: 

#Repositories
repos=$(curl -s "https://api.github.com/users/$username/repos?per_page=1000")

#Loop through the list of repositories
for repo in $(echo "${repos}" | jq -r '.[] | @base64'); do
    repo_name=$(echo ${repo} | base64 --decode | jq -r '.name')
    repo_desc=$(echo ${repo} | base64 --decode | jq -r '.description')
    
    echo "$repo_name - $repo_desc"
done

