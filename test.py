from string import Template
filein = open( 'template.txt' )
src = Template( filein.read() )
#document data
nr_vlans = (input("How many vlans besides vlan 110: "))
result = ""
for i in range(int(nr_vlans)):
	vlan_nb = (input("Vlan number: "))
	vlan = "vlan "+vlan_nb
	description = "description "+(input("Description: "))
	# is_igmp = (input("igmp-snooping active [yes/no]: "))
	#vlan 6XX
	# if is_igmp == "yes" and description!="":
	if vlan_nb.startswith("6") and description!="":
		list = [description, 'igmp-snooping', 'flooding unknown-unicast disable']
	#vlan 600
	# elif is_igmp == "yes" and description=="":
	elif vlan_nb.startswith("6") and description=="":
		list = ['igmp-snooping','flooding unknown-unicast disable']
	#vlan 7XX
	# elif is_igmp == "no" and description!="":
	elif vlan_nb.startswith("7") and description!="":
		list = [description, 'flooding unknown-unicast disable']
	#vlan 700
	# elif is_igmp == "no" and description=="":
	elif vlan_nb.startswith("7") and description=="":
		list = ['flooding unknown-unicast disable']

	d={ 'vlan':vlan, 'list':"\n".join(list) }
	#do the substitution
	result += src.substitute(d)+"\n"
print ("\n\n\nvlan 110"+"\n"+result)
filein.close()