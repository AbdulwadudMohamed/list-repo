#dont need (#!/bin/sh)?

#Declaring Variables
#Username
username="AbdulwadudMohamed"
#Stored Reponame Variables
Rn1="Temp"
Rn2="Temp"
Rn3="Temp"
Rn4="Temp"
Rn5="Temp"
Rn6="Temp"
#Stored Commit Variables
Rc1=1
Rc2=1
Rc3=1
Rc4=1
Rc5=1
Rc6=1
#Counter Variable
n=1

#Repositories changed to 100 per page instead of 1000
repos=$(curl \
-H "Authorization: Bearer $TOKEN" \
-s "https://api.github.com/users/$username/repos?per_page=100")

#Function to store Repo names and commits - currently not optimised
Store() {
    #names
    if [ $n = 1 ]; then
        Rn1=$1
        n=$(($n+1))
        #echo "$Rn1"
    fi
    if [ $n == 2 ]; then
        Rn2=$1
        n=$(($n+1))
        #echo "$Rn2"
    fi
    if [ $n == 3 ]; then
        Rn3=$1
        n=$(($n+1))
        #echo "$Rn3"
    fi
    if [ $n == 4 ]; then
        Rn4=$1
        n=$(($n+1))
        #echo "$Rn4"
    fi
    if [ $n == 5 ]; then
        Rn5=$1
        n=$(($n+1))
        #echo "$Rn5"
    fi
    if [ $n == 6 ]; then
        Rn6=$1
        n=$(($n+1))
        #echo "$Rn6"
    fi

    #commits
    if [ $n == 1 ]; then
        Rc1=$2
        n=$(($n+1))
    fi
    if [ $n == 2 ]; then
        Rc2=$2
        n=$(($n+1))
    fi
    if [ $n == 3 ]; then
        Rc3=$2
        n=$(($n+1))
    fi
    if [ $n == 4 ]; then
        Rc4=$2
        n=$(($n+1))
    fi
    if [ $n == 5 ]; then
        Rc5=$2
        n=$(($n+1))
    fi
    if [ $n == 6 ]; then
        Rc6=$2
        n=$(($n+1))
    fi
}

#Loop through the list of repositories
for repo in $(echo "${repos}" | jq -r '.[] | @base64'); do
    repo_name=$(echo ${repo} | base64 --decode | jq -r '.name')
    repo_desc=$(echo ${repo} | base64 --decode | jq -r '.description')
    commits=$(curl -s -k "https://api.github.com/repos/$username/$repo_name/commits?per_page=1" | sed -n '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p')
    commits=$(curl \
    -H "Authorization: Bearer $TOKEN" \
    -s https://api.github.com/repos/$username/$repo_name/commits?per_page=100 | jq '. | length')
    
    #Output
    echo "Collected Data"
    echo "Repo Name: $repo_name" 
    echo "Repo Desc: $repo_desc"
    echo "No of commits: $commits"
    
    #Call Store function to capture data
    Store $repo_name $commits
    
done