interface_type	= int(raw_input("Interface type (10 or 100): "))
interface 		= int(raw_input("Interface number: "))
olt_name		= raw_input("OLT name: ")
olt_chassis		= raw_input("N° of chassis: ")
co_name 		= raw_input("CO name: ")



def switch_area(area):
	switcher = {
	"00": "ROMA",
	"0": "ROMA",
	"01": "MILANO",
	"1": "MILANO",
	"02": "BOLOGNA",
	"2": "BOLOGNA",
	"03": "NAPOLI",
	"3": "NAPOLI",
	"04": "PALERMO",
	"4": "PALERMO",
	"F2": "NET_NW",
	"f2": "NET_NW",
	"F3": "NET_NE",
	"f3": "NET_NE",
	"F4": "NET_CENTER",
	"f4": "NET_CENTER",
	"F5": "NET_SE",
	"f5": "NET_SE",
	"F6": "NET_SW",
	"f6": "NET_SW"
	}
	area_name = switcher.get(area, "Invalid area")

area = switch_area(olt_area)





if (nbx_name.startswith('NBX')):
	print "\n\ninterface TenGigE0/0/0/"+str(interface)+" description Trunk vers "+nbx_name[0:15]
	print "interface TenGigE0/0/0/"+str(interface)+".835 description IPv4 bootbox vers NBX_"+nbx_name[0:15]
	print "interface TenGigE0/0/0/"+str(interface)+".836 description IPv6 vers NBX_"+nbx_name[0:15]+"\n"
else:
	print "\ninterface TenGigE0/0/0/"+str(interface)+" description Trunk vers NBX_"+nbx_name[0:11]
	print "interface TenGigE0/0/0/"+str(interface)+".835 description IPv4 bootbox vers NBX_"+nbx_name[0:11]
	print "interface TenGigE0/0/0/"+str(interface)+".836 description IPv6 vers NBX_"+nbx_name[0:11]+"\n"

print "interface TenGigE0/0/0/"+str(interface)+" mtu 9212"
print "interface TenGigE0/0/0/"+str(interface)+".835 l2transport"
print " encapsulation dot1q 835 exact"
print " rewrite ingress tag pop 1 symmetric"
print "no interface TenGigE0/0/0/"+str(interface)+" shutdown\n"

print "interface TenGigE0/0/0/"+str(interface)+".836 l2transport"
print " encapsulation dot1q 836 exact"
print " rewrite ingress tag pop 1 symmetric"
print "l2vpn bridge group 835 bridge-domain 835 interface TenGigE0/0/0/"+str(interface)+".835"
print "l2vpn bridge group 836 bridge-domain 836 interface TenGigE0/0/0/"+str(interface)+".836\n\n"

print co_name+",\'Te0/0/0/"+str(interface)+"\',NBX_"+nbx_name[0:11]+"\n"

buaritaf-ncs540-1,Hu0/0/1/0,of-va-02-1,Hu0/0/0