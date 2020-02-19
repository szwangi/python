interface	= int(raw_input("Id of port Te0/0/0/0/0 in table interface : "))
mac_addr 	= int(raw_input("MAC @ of port Te0/0/0/0/0 of NCS-540: "), base = 16)

print "update hwaddr set addr = x'"+hex(mac_addr)[2:]+"' where interface = "+str(interface)+" limit 1;"
for i in range(0, 31):
	mac_addr += 4
	interface += 1
	print "update hwaddr set addr = x'"+hex(mac_addr)[2:]+"' where interface = "+str(interface)+" limit 1;"