interface 	= int(raw_input("Interface number: "))
nbx_name	= raw_input("NBX name: ")
if (nbx_name.startswith('NBX')):
	print "\ninterface TenGigE0/0/0/"+str(interface)+" description Trunk vers "+nbx_name[0:15]
	print "interface TenGigE0/0/0/"+str(interface)+".835 description IPv4 bootbox vers NBX_"+nbx_name[0:15]
	print "interface TenGigE0/0/0/"+str(interface)+".836 description IPv6 vers NBX_"+nbx_name[0:15]+"\n"
else:
	print "\ninterface TenGigE0/0/0/"+str(interface)+" description Trunk vers NBX_"+nbx_name[0:11]
	print "interface TenGigE0/0/0/"+str(interface)+".835 description IPv4 bootbox vers NBX_"+nbx_name[0:11]
	print "interface TenGigE0/0/0/"+str(interface)+".836 description IPv6 vers NBX_"+nbx_name[0:11]+"\n"

print "interface TenGigE0/0/0/"+str(interface)+".835 l2transport"
print " encapsulation dot1q 835 exact"
print " rewrite ingress tag pop 1 symmetric"
print "no interface TenGigE0/0/0/"+str(interface)+" shutdown\n"

print "interface TenGigE0/0/0/"+str(interface)+".836 l2transport"
print " encapsulation dot1q 836 exact"
print " rewrite ingress tag pop 1 symmetric"
print "l2vpn bridge group 835 bridge-domain 835 interface TenGigE0/0/0/"+str(interface)+".835"
print "l2vpn bridge group 836 bridge-domain 836 interface TenGigE0/0/0/"+str(interface)+".836\n"