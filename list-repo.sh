#!/bin/sh
#Use the GitHub API to get: 

username="AbdulwadudMohamed"

#Repositories
repos=$(curl -s "https://api.github.com/users/$username/repos?per_page=1000")

#Loop through the list of repositories
for repo in $(echo "${repos}" | jq -r '.[] | @base64'); do
    repo_name=$(echo ${repo} | base64 --decode | jq -r '.name')
    repo_desc=$(echo ${repo} | base64 --decode | jq -r '.description')
    commits=$(curl -s -I -k "https://api.github.com/repos/$username/$repo_name/commits?per_page=1" | sed -n '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p')
   
    #Output
    echo ""
    echo "Repo Name: $repo_name" 
    echo "Repo Desc: $repo_desc"
    echo "No of commits: $commits"
done

#Export variables
export repo_name, commits
