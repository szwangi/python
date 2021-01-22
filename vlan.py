from string import Template
filein = open( 'template_vlan.txt' )
template_vlan = Template( filein.read() )
#document data
nr_vlans = (input("How many vlans besides vlan 110: "))
result = ""

for i in range(int(nr_vlans)):
	vlan_nb = (input("Vlan number: "))
	vlan = "vlan "+vlan_nb
	description = input("Description: ")
	vlan_description = "description "+ description
	#vlan 6XX
	if vlan_nb.startswith("6") and description!="":
		list = [vlan_description, 'igmp-snooping', 'flooding unknown-unicast disable']
	#vlan 600
	elif vlan_nb.startswith("6") and description=="":
		list = ['igmp-snooping','flooding unknown-unicast disable']
	#vlan 7XX
	elif vlan_nb.startswith("7") and description!="":
		list = [vlan_description, 'flooding unknown-unicast disable']
	#vlan 700
	elif vlan_nb.startswith("7") and description=="":
		list = ['flooding unknown-unicast disable']

	d={ 'vlan':vlan, 'list':"\n".join(list) }
	#do the substitution
	result += template_vlan.substitute(d)+"\n"

print ("\n\n\nvlan 110"+"\n"+result)
filein.close()
