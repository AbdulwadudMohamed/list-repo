#This allows to call&run scripts
import subprocess
import sys

#Define the username to pass to the script
GithubUsername = "AbdulwadudMohamed"

# Call the script and pass the argumentss
subprocess.call([sys.executable,'./list-repo.sh'])
