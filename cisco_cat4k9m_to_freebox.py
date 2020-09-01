path = "/home/wojciech/python/conf_cisco_bre01.sw"
try:
	f = open(path)
	hostname = (f.readline().split("#")[0])
	for line in f:
		print (line, end =" ")
except Exception as e:
	raise e
	print(e)
finally:
	f.close()

