#!/bin/bash

echo "...Flushing Iptables rules"
iptables -F
echo ""

echo "...allwoing via client net"
iptables -A INPUT -s 172.16.31.0/24 -p tcp --dport 49999 -j ACCEPT
echo ""

echo "...disabling via server net"
iptables -A INPUT -s 172.16.30.0/24 -p tcp --dport 49999 -j REJECT
echo""
iptables -n -L --line-numbers | grep 1
