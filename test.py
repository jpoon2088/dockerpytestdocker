import docker
##client = docker.APIClient(base_url='unix://var/run/docker.sock'
client = docker.APIClient(tcp://127.0.0.1:1234, timeout=10)
pullresult = client.pull("alpine")
listresult = client.containers(all='true')
print(listresult)
