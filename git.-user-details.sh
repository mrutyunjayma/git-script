#!/bin/bash


#GitHub api url

API_URL="https://api.github.com"


#Github Username and token

USERNAME=$username
TOKEN=$token


#user Repository information

REPO_OWNER=$1
REPO_NAME=$2


# Function  to make a GET request to the GitHub API and list users with read access to the repository
#This single function and you can create two function one for api request and  another for list of user

function list_user_with_read_access {
        local url="${API_URL}/repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
        collaborators=$(curl -s -u "${USERNAME}:${TOKEN}" "$url" | jq -r '.[] | select(.permissions.pull == true) | .login')

        if [[ -z "$collaborators" ]]; then
                echo "No users have access to this repo"
        else
                echo "user with access"
                echo "$collaborators"
        fi
}

# call the function

list_user_with_read_access