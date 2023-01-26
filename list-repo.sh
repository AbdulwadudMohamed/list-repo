#!/bin/sh

# Set your GitHub username
username="AbdulwadudMohamed"

# Use the GitHub API to get a list of your repositories
repos=$(curl -s "https://api.github.com/users/$username/repos?per_page=1000")

# Loop through the list of repositories
for repo in $(echo "${repos}" | jq -r '.[] | @base64'); do
    repo_name=$(echo ${repo} | base64 --decode | jq -r '.name')
    repo_desc=$(echo ${repo} | base64 --decode | jq -r '.description')
    echo "$repo_name - $repo_desc"
done

