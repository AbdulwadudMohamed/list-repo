#This allows to call&run scripts
import subprocess

#Call the script and pass the arguments
result = subprocess.run(["bash", "list-repo.sh"])

#Check the return code
if result.returncode == 0:
    print("Script completed successfully.")
else:
    print("Script failed with error code", result.returncode)

