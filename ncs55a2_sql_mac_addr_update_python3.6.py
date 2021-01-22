# interface	= int(0)
# mac_addr 	= int('A0B4398A3000', base = 16)
interface	= int( input( "Id of port Te0/0/0/0 in table interface : "))
mac_addr 	= int( input( "MAC @ of port Te0/0/0/0 of NCS-540: "), base = 16 )
print ("update hwaddr set addr = x'"+hex(mac_addr)[2:]+"' where interface = "+str(interface)+" limit 1;")
for i in range(0, 39):
	mac_addr += 1
	interface += 1
	print ("update hwaddr set addr = x'"+hex(mac_addr)[2:]+"' where interface = "+str(interface)+" limit 1;")