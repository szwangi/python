vlan 110
vlan 635
description dslam_priv
flooding unknown-unicast disable
igmp-snooping
vlan 735
flooding unknown-unicast disable
description dslam_pub

int be1
description Trunk vers mex01-1.sw
vlan 110
vlan 635
vlan 735

int be2
description Trunk vers amg01-1.sw
vlan 110
vlan 635
vlan 735





interface TenGigabitEthernet 0/0/0
description DSLAM bre01-1 bre01-2 bre01-3 + gw16
vlan 110
vlan 635
vlan 735
mtu 9198


interface TenGigabitEthernet 0/0/1
description Trunk vers mex01-1.sw
bundle-ethernet 1
mtu 9198



interface TenGigabitEthernet 0/0/2
description Trunk vers mex01-1.sw
bundle-ethernet 1
mtu 9198

interface TenGigabitEthernet 0/0/3
description Trunk vers mex01-1.sw
bundle-ethernet 1
mtu 9198

interface TenGigabitEthernet 0/0/4
description Trunk vers mex01-1.sw
bundle-ethernet 1
mtu 9198

interface TenGigabitEthernet 0/0/5
description DSLAM bpb01-1
vlan 635
vlan 735
mtu 9198


interface TenGigabitEthernet 0/0/6
description DSLAM bre01-mob-1
vlan 635
vlan 735
mtu 9198

interface TenGigabitEthernet 0/0/7
description OLT bre01-olt-1
vlan 110
vlan 635
vlan 735
mtu 9198




interface TenGigabitEthernet 0/1/0
description Trunk vers amg01-1.sw
bundle-ethernet 1
mtu 9198

interface TenGigabitEthernet 0/1/1
description Trunk vers amg01-1.sw
bundle-ethernet 1
mtu 9198

interface TenGigabitEthernet 0/1/2
description DSLAM vvt01-1
vlan 635
vlan 735
mtu 9198

interface TenGigabitEthernet 0/1/3
description DSLAM tht39-1
vlan 635
vlan 735
mtu 9198

interface TenGigabitEthernet 0/1/4
description DSLAM plt01-1
vlan 635
vlan 735
mtu 9198


interface TenGigabitEthernet 0/1/5
description DSLAM jcq01-1
vlan 635
vlan 735
mtu 9198

