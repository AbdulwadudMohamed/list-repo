#Call & run scripts
import subprocess
#Data representation
import matplotlib.pyplot as plt
#Getting variables from bash script
import os

#Call the script and pass the arguments
result = subprocess.run(["bash", "list-repo.sh"])


#Check the return code
if result.returncode == 0:
    print("Script completed successfully.")
else:
    print("Script failed with error code", result.returncode)

#Getting enviornment variables from script

#repo_name=os.environ["repo_name"]
#repo_commits=os.environ[commits]

#Data representation

#Data to represent
data = [10, 20, 30, 40, 50]

#Create a new figure and axes
fig, ax = plt.subplots()

#Create the bar chart
ax.bar(range(len(data)), data)

#Set the x-axis labels
ax.set_xticks(range(len(data)))
ax.set_xticklabels(['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5'])

#Set the y-axis label
ax.set_ylabel('Value')

#Show the plot
plt.show()

