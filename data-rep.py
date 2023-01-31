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


#Read and store Repo commits
repo_commit_array=[]
with open("REPOCOMMITS.txt", "r") as g:
    for line in g:
        repo_commit_array.append(int(line.strip()))

print (repo_name_array)
print (repo_commit_array)

#Data representation

#Data to represent
#data = [10, 20, 30, 40, 50]

#Create a new figure and axes
#fig, ax = plt.subplots()

#Create the bar chart
#ax.bar(range(len(data)), data)

#Set the x-axis labels
#ax.set_xticks(range(len(data)))
#ax.set_xticklabels(['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5'])

#Set the y-axis label
#ax.set_ylabel('Value')

#Show the plot
#plt.show()