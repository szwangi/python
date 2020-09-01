bre01-1.sw#sh int desc
Interface                      Status         Protocol Description                                            
Vl1                            admin down     down                                                            
Vl110                          up             up                                                              
Fa1                            admin down     down                                                              
Te1/1                          up             up       Trunk vers mex01-1.sw                                    
Te1/2                          up             up       Trunk vers mex01-1.sw                                    
Te1/3                          up             up       Trunk vers mex01-1.sw                                     
Te1/4                          up             up       Trunk vers mex01-1.sw                                     
Te1/5                          up             up       DSLAM bpb01-1                                                 
Te1/6                          up             up       DSLAM bre01-mob-1                                             
Te1/7                          up             up       Trunk vers amg01-1.sw                                         
Te1/8                          up             up       Trunk vers amg01-1.sw                                         
Te2/1                          up             up       DSLAM vvt01-1                                                 
Te2/2                          admin down     down                                                                   
Te2/3                          admin down     down     oversubscribed                                                
Te2/4                          up             up       DSLAM tht39-1                                                 
Te2/5                          up             up       OLT bre01-olt-1                                                
Te2/6                          up             up       DSLAM bre01-1 bre01-2 bre01-3 + GW16                           
Te2/7                          up             up       DSLAM plt01-1                                                  
Te2/8                          up             up       DSLAM jcq01-1                                                    
Gi2/9                          admin down     down                                                                      
Gi2/10                         admin down     down                                                                      
Gi2/11                         admin down     down                                                                      
Gi2/12                         admin down     down                                                                      
Gi2/13                         admin down     down                                                                      
Gi2/14                         admin down     down                                                                      
Gi2/15                         admin down     down                                                                      
Gi2/16                         admin down     down                                                                       
Gi2/17                         admin down     down                                                                       
Gi2/18                         admin down     down                                                                       
Gi2/19                         admin down     down                                                                        
Gi2/20                         admin down     down                                                                        
Gi2/21                         admin down     down     
Gi2/22                         admin down     down     
Gi2/23                         admin down     down     
Gi2/24                         admin down     down     
Po1                            up             up       Trunk vers mex01-1.sw
Po2                            up             up       Trunk vers amg01-1.sw
bre01-1.sw#sh run 
Building configuration...

Current configuration : 12741 bytes
!
! Last configuration change at 09:54:40 CEST Fri May 29 2020 by jcharpentier
! NVRAM config last updated at 09:54:50 CEST Fri May 29 2020 by jcharpentier
!
version 15.0
no service pad
service timestamps debug datetime localtime show-timezone
service timestamps log datetime localtime show-timezone
service password-encryption
service internal
service compress-config
service counters max age 10
service unsupported-transceiver
!
hostname bre01-1.sw
!
boot-start-marker
boot system flash bootflash:cat4500e-entservicesk9-mz.150-2.SG10.bin
boot system flash bootflash:
boot-end-marker
!
logging buffered 100000
logging rate-limit all 10
enable secret 5 $1$/6fz$Lt8HqBvkTl1YMG/ONks2S1
enable password 7 000D1F0F055F
!
username rani privilege 15 password 7 0813587E080A1646
username cisco privilege 15 password 7 000000000000000000
username acaillet privilege 15 password 7 1054063B0C
username fgander privilege 15 password 7 095C4F1A1700021C0E19
username jeremy privilege 15 password 7 09464B1B1E0A134A5F
username gclauzon privilege 15 password 7 0518153C2A47440B
username sboumendil privilege 15 password 7 044B1F0F1F2E594D0C0D
!
!
aaa new-model
!
!
aaa group server radius AUTH_NET
 server 172.18.31.17 auth-port 1812 acct-port 1813
 server 172.18.31.49 auth-port 1812 acct-port 1813
!
aaa authentication login ADMIN local-case
aaa authentication login use-radius group AUTH_NET local
aaa authorization exec ADMIN local 
aaa authorization exec use-radius group AUTH_NET if-authenticated 
!
!
!
aaa session-id common
clock timezone CET 1
clock summer-time CEST recurring last Sun Mar 2:00 last Sun Oct 3:00
clock calendar-valid
udld enable

ip subnet-zero
no ip source-route
no ip gratuitous-arps
ip icmp rate-limit unreachable 10
no ip domain-lookup
ip vrf mgmtVrf
!
ip multicast-routing 
!
!
ip igmp snooping last-member-query-interval 5000
vtp domain FREE
vtp mode transparent
cluster run
!
!
!
no errdisable detect cause gbic-invalid
errdisable recovery cause udld
errdisable recovery cause bpduguard
errdisable recovery cause security-violation
errdisable recovery cause channel-misconfig
errdisable recovery cause pagp-flap
errdisable recovery cause dtp-flap
errdisable recovery cause link-flap
errdisable recovery cause sfp-config-mismatch
errdisable recovery cause gbic-invalid
errdisable recovery cause l2ptguard
errdisable recovery cause psecure-violation
errdisable recovery cause dhcp-rate-limit
errdisable recovery cause mac-limit
errdisable recovery cause unicast-flood
errdisable recovery cause vmps
errdisable recovery cause storm-control
errdisable recovery cause inline-power
errdisable recovery cause arp-inspection
errdisable recovery cause link-monitor-failure
errdisable recovery cause oam-remote-failure
errdisable recovery interval 30
power redundancy-mode redundant
!
!
!
!
spanning-tree mode pvst
no spanning-tree optimize bpdu transmission
spanning-tree extend system-id
no spanning-tree vlan 1-4094
!
vlan internal allocation policy ascending
!
vlan 110
 name mgt
!
vlan 635
 name dslam_priv
!
vlan 735  
 name dslam_pub
!
!
class-map match-all free_tv
  match cos  7 
class-map match-all free_voip
  match cos  5 
!
policy-map set_cos
 class class-default
policy-map free_qos
 class free_tv
    bandwidth remaining percent 70
 class free_voip
    priority
 class class-default
    bandwidth remaining percent 20
!
!
!
interface Port-channel1
 description Trunk vers mex01-1.sw
 switchport
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
!
interface Port-channel2
 description Trunk vers amg01-1.sw
 switchport
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
!
interface FastEthernet1
 ip vrf forwarding mgmtVrf
 no ip address
 shutdown
 speed auto
 duplex auto
!
interface TenGigabitEthernet1/1
 description Trunk vers mex01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 1 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet1/2
 description Trunk vers mex01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 1 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet1/3
 description Trunk vers mex01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 1 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet1/4
 description Trunk vers mex01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 1 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet1/5
 description DSLAM bpb01-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet1/6
 description DSLAM bre01-mob-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet1/7
 description Trunk vers amg01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 2 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet1/8
 description Trunk vers amg01-1.sw
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 channel-group 2 mode active
 service-policy output free_qos
!
interface TenGigabitEthernet2/1
 description DSLAM vvt01-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/2
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/3
 description oversubscribed
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/4
 description DSLAM tht39-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/5
 description OLT bre01-olt-1
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/6
 description DSLAM bre01-1 bre01-2 bre01-3 + GW16
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/7
 description DSLAM plt01-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface TenGigabitEthernet2/8
 description DSLAM jcq01-1
 switchport trunk allowed vlan 635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/9
 shutdown
 no cdp enable
!
interface GigabitEthernet2/10
 shutdown
 no cdp enable
!
interface GigabitEthernet2/11
 shutdown
 no cdp enable
!
interface GigabitEthernet2/12
 shutdown
 no cdp enable
!
interface GigabitEthernet2/13
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!         
interface GigabitEthernet2/14
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/15
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/16
 shutdown
 no cdp enable
!
interface GigabitEthernet2/17
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/18
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/19
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/20
 switchport trunk allowed vlan 110,635,735
 switchport mode trunk
 mtu 9198
 logging event link-status
 logging event trunk-status
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/21
 no switchport
 no ip address
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/22
 no switchport
 no ip address
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/23
 no switchport
 no ip address
 load-interval 30
 shutdown
 udld port
 flowcontrol receive off
 no cdp enable
 service-policy output free_qos
!
interface GigabitEthernet2/24
 shutdown
 no cdp enable
!
interface Vlan1
 no ip address
 shutdown
!
interface Vlan110
 ip address 172.21.1.28 255.255.255.0
!
ip route 172.16.0.0 255.240.0.0 172.21.1.254
no ip http server
no ip http secure-server
!
!
ip access-list standard snmp_acl
 permit 172.18.13.239
 permit 172.18.13.238
 permit 172.16.253.202
 permit 172.18.62.12
 permit 172.18.24.4
 permit 172.18.31.9
 permit 172.18.31.17
 permit 172.18.31.16
 permit 172.18.66.47
 permit 172.18.67.33
!
!
access-list 10 permit 212.27.32.0 0.0.0.127
access-list 10 permit 213.228.1.64 0.0.0.63
access-list 10 permit 213.228.0.224 0.0.0.31
access-list 10 permit 192.168.0.0 0.0.0.255
access-list 10 permit 212.27.39.0 0.0.0.255
access-list 10 permit 172.16.0.0 0.239.255.255
access-list 10 deny   any
no cdp run
!
!
snmp-server community Tokata RO snmp_acl
snmp-server location "NRA BRE01"
snmp-server contact "Proxad NOC <ops@proxad.net>"
radius-server attribute 6 on-for-login-auth
radius-server host 172.18.31.17 auth-port 1812 acct-port 1813 non-standard timeout 2 retransmit 1 key 7 104A021F0D04030F000F2C23727D
radius-server host 172.18.31.49 auth-port 1812 acct-port 1813 non-standard timeout 2 retransmit 1 key 7 104A021F0D04030F000F2C23727D
!
line con 0
 stopbits 1
line vty 0 4
 access-class 10 in vrf-also
 password 7 02160B57040B
 authorization exec use-radius
 login authentication use-radius
 transport input telnet
line vty 5 15
 access-class 10 in vrf-also
 authorization exec use-radius
 login authentication use-radius
 transport input telnet
!
scheduler runtime netinput 100
ntp clock-period 17181695
ntp server 172.21.1.254
mac address-table notification mac-move
end 
