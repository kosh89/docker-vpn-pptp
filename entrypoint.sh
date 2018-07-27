#!/bin/sh

set -e

# enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# ipconfig rules
iptables --table nat --append POSTROUTING --out-interface eth0 --jump MASQUERADE

iptables --table nat --append POSTROUTING --out-interface ppp0 --jump MASQUERADE
iptables --insert INPUT --source 10.0.0.0/8 --in-interface ppp0 --jump ACCEPT
iptables --append FORWARD --in-interface eth0 --jump ACCEPT

iptables -t mangle -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

exec "$@"
