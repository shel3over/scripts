route del default
route add -net 192.168.20.0 netmask 255.255.255.0 dev ppp0
route add -net 192.168.1.0 netmask 255.255.255.0 dev ppp0
route add default gw 192.168.2.1
