#Call & run scripts
#import subprocess
#Data representation
import matplotlib.pyplot as plt

#result = subprocess.run(['Bash', './list-repo.sh'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True)

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

#Create a new figure and axes
fig, ax = plt.subplots()
fig.subplots_adjust(bottom=0.3) # increase bottom parameter to 0.2
fig.set_size_inches(10,5) # sets the size of the figure

#Create the bar chart
ax.bar(range(len(repo_commit_array)), repo_commit_array)

#Set the x-axis labels
ax.set_xlabel('Repository names')
ax.set_xticks(range(len(repo_commit_array)))
ax.set_xticklabels(repo_name_array, rotation=55, fontsize=7)

#Set the y-axis label and limit
ax.set_ylabel('Commits')
ax.set_ylim(bottom=0, top=max(repo_commit_array)+10)

#Show the plot
plt.show()
