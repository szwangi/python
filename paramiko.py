import paramiko
prov_client = SSHClient()
prov_client.load_system_host_keys()
prov_client.connect('prov.mgt.proxad.it', allow_agent=False)
stdin, stdout, stderr = client.exec_command('ls -l')1