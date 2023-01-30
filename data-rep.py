#Call & run scripts
import subprocess
#Data representation
import matplotlib.pyplot as plt

#Call the script and pass the arguments
import subprocess

result = subprocess.run(['./list-repo.sh'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

if result.returncode == 0:
    print("Script completed successfully.")
else:
    print("Script failed with error code", result.returncode)

#if exported_repo_array.returncode != 0:
#    print("Error:", exported_repo_array.stderr)
#else:
    #Extract the exported repo_array string
#    repo_name_array = exported_repo_array.stdout.split("=(", 1)[1][:-2]

    #Convert the string to a list of elements
#    python_repo_name_array = repo_name_array.strip().split(" ")

f = open("REPONAMES.txt", "r")
print(f.readline())








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

