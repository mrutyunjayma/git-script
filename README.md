📁 GitHub Repository Collaborator Access Scripts
This project demonstrates two Bash script approaches to list GitHub repository collaborators who have read access via the GitHub API.

📌 Overview
Method	Description	Use Case
✅ Single Function	All logic (API call + filter) inside one function	Quick, short scripts
✅ Two Functions (Professional)	Separation of logic: one for API call, one for processing/filtering	Professional, modular code

🖥️ Setup Instructions
✅ Step 1: Export your GitHub credentials
bash
Copy
Edit
export username="your-github-username"
export token="your-personal-access-token"
✅ Note: Use a fine-grained PAT with read:org and repo access.

✅ Method 1: Single Function Script
📄 File: single-function-script.sh

In this approach:

One function handles API call + filtering + display.

Example Code:

bash
Copy
Edit
function list_user_with_read_access {
    local url="${API_URL}/repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    collaborators=$(curl -s -u "${USERNAME}:${TOKEN}" "$url" | jq -r '.[] | select(.permissions.pull == true) | .login')
    if [[ -z "$collaborators" ]]; then
        echo "No users have access to this repo"
    else
        echo "Users with access:"
        echo "$collaborators"
    fi
}
✅ Run it:

bash
Copy
Edit
./single-function-script.sh <repo-owner> <repo-name>
✅ Method 2: Two Functions Script (Recommended)
📄 File: two-function-script.sh

In this professional approach:

Function 1: Calls GitHub API.

Function 2: Filters and displays collaborators with read access.

Includes optional raw API output (useful for debugging).

Example Code Structure:

bash
Copy
Edit
function github_api_get { ... }

function list_users_with_read_access { ... }

# Main
list_users_with_read_access
✅ Run it:

bash
Copy
Edit
./two-function-script.sh <repo-owner> <repo-name>
✅ Summary: Which One Should You Use?
Method	When to Use
✅ Single Function	Small, personal scripts, quick checks
✅ Two Functions	Production, team projects, scalable scripts

🏷️ Credits
Created by MJ, following GitHub API best practices for Bash scripting.
