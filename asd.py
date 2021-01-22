import paramiko

k = paramiko.RSAKey.from_private_key_file(filename = "/home/wojciech/.ssh/id_rsa", password = "Spiewak153")
client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.load_system_host_keys()

# print(agent.get_keys())
client.connect(	hostname = "prov.mgt.proxad.it", username = "root", pkey = k, passphrase = "Spiewak153")
stdin, stdout, stderr = client.exec_command('ls -l')
print (stdout.read())
print (stderr.read())
client.close()