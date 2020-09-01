[nsg93-1.sw]:exec> sh int desc
Interface         Speed     State     Description
Mg0/0                       down      
Pu                          up        CPU interface
Pp0                         up        Physical CPU interface from 2*100G Arad+ line-card
Pp1                         shutdown  Physical CPU interface from 2*100G Arad+ line-card
Te0/0/0           10G       up        DSLAM nsg93-9 nsg93-10 nsg93-11 nsg93-12 GW16
Te0/0/1           10G       up        DSLAM nsg93-5 nsg93-6 nsg93-7 nsg93-8
Te0/0/2           10G       up        DSLAM nsg93-1 nsg93-2 nsg93-3 nsg93-4
Te0/0/3           10G       up        OLT nsg93-olt-1
Te0/0/4           10G       up        OLT nsg93-olt-5
Te0/0/5           10G       up        OLT nsg93-olt-9
Te0/0/6           10G       offline   
Te0/0/7           10G       offline   
Te0/1/0           10G       up        DSLAM vls93-mob-1
Te0/1/1           10G       up        DSLAM vls93-1 vls93-2 vls93-3 vls93-4
Te0/1/2           10G       up        DSLAM vls93-5
Te0/1/3           10G       up        DSLAM nyr93-1
Te0/1/4           10G       up        OLT nsg93-olt-13
Te0/1/5           10G       offline   
Te0/1/6           10G       up        Trunk vers pom94-1.sw
Te0/1/7           10G       up        Trunk vers pom94-1.sw
Te1/0/0           10G       up        Trunk vers pom94-1.sw
Te1/0/1           10G       up        Trunk vers pom94-1.sw
Te1/0/2           10G       offline   
Te1/0/3           10G       offline   
Te1/0/4           10G       up        DSLAM des77-1
Te1/0/5           10G       offline   
Te1/0/6           10G       offline   
Te1/0/7           10G       offline   
Hu1/1/0           100G      up        Trunk vers joinville-9k-1
Be1               40G       up        Trunk vers pom94-1.sw
Be2               100G      up        Trunk vers joinville-9k-1
[nsg93-1.sw]:exec> sh run 
hostname nsg93-1.sw 
vlan 110 
vlan 600 
        igmp-snooping 
        flooding unknown-unicast 
                disable 
vlan 623 
        description dslam_priv 
        igmp-snooping 
        flooding unknown-unicast 
                disable 
vlan 700 
        flooding unknown-unicast 
                disable 
vlan 723 
        description dslam_pub 
        flooding unknown-unicast 
                disable 
interface TenGigabitEthernet 0/0/0 
        description DSLAM nsg93-9 nsg93-10 nsg93-11 nsg93-12 GW16 
        vlan 110 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/0/1 
        description DSLAM nsg93-5 nsg93-6 nsg93-7 nsg93-8 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/0/2 
        description DSLAM nsg93-1 nsg93-2 nsg93-3 nsg93-4 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/0/3 
        description OLT nsg93-olt-1 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/0/4 
        description OLT nsg93-olt-5 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/0/5 
        description OLT nsg93-olt-9 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/0 
        description DSLAM vls93-mob-1 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/1 
        description DSLAM vls93-1 vls93-2 vls93-3 vls93-4 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/2 
        description DSLAM vls93-5 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/3 
        description DSLAM nyr93-1 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/4 
        description OLT nsg93-olt-13 
        vlan 623 
        vlan 723 
        mtu 9198 
interface TenGigabitEthernet 0/1/6 
        description Trunk vers pom94-1.sw 
        mtu 9198 
        bundle-ethernet 1 
interface TenGigabitEthernet 0/1/7 
        description Trunk vers pom94-1.sw 
        mtu 9198 
        bundle-ethernet 1 
interface TenGigabitEthernet 1/0/0 
        description Trunk vers pom94-1.sw 
        mtu 9198 
        bundle-ethernet 1 
interface TenGigabitEthernet 1/0/1 
        description Trunk vers pom94-1.sw 
        mtu 9198 
        bundle-ethernet 1 
interface TenGigabitEthernet 1/0/4 
        description DSLAM des77-1 
        vlan 600 
        vlan 700 
        mtu 9198 
interface HundredGigabitEthernet 1/1/0 
        description Trunk vers joinville-9k-1 
        mtu 9198 
        bundle-ethernet 2 
        fec-mode none 
interface VLAN 110 
interface BundleEthernet 1 
        description Trunk vers pom94-1.sw 
        vlan 110 
        vlan 623 
        vlan 723 
interface BundleEthernet 2 
        description Trunk vers joinville-9k-1 
        vlan 110 
        vlan 600 
        vlan 623 
        vlan 700 
        vlan 723 
