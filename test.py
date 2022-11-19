import docker
client = docker.APIClient(base_url='unix://var/run/docker.sock')
pullresult = client.pull("alpine")
listresult = client.containers(all='true')
print(listresult)
