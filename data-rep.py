#Call & run scripts
#import subprocess
#Data representation
import matplotlib.pyplot as plt

#result = subprocess.run(['Bash', './list-repo.sh'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True)
#print (result)
#if result.returncode == 0:
#    print("(Return code) Script completed successfully.")
#else:
#    print("(Return code) Script failed with error code", result.returncode)

#Read and store Repo names
repo_name_array = []
with open("REPONAMES.txt", "r") as f:
    for line in f:
        repo_name_array.append(line.strip())


#Read and store Repo commits as ints
repo_commit_array=[]
with open("REPOCOMMITS.txt", "r") as g:
    for line in g:
        repo_commit_array.append(int(line.strip()))

#Data to represent
data = [10, 20, 30, 40, 50]

#Create a new figure and axes
fig, ax = plt.subplots()

#Create the bar chart
ax.bar(range(len(repo_commit_array)), repo_commit_array)

#Set the x-axis labels
ax.set_xticks(range(len(repo_commit_array)))
ax.set_xticklabels(repo_name_array)

#Set the y-axis label
ax.set_ylabel('Value')

#Show the plot
plt.show()