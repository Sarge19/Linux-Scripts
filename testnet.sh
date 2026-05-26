#!/bin/bash

echo""
echo -e "\033[1mStatus of NetworkManager\033[0m" 
systemctl status NetworkManager | grep active > net.txt
ccat -G Type=yellow -G Plaintext=yellow -G Decimal=yellow net.txt

echo""
echo -e "\033[1mFirewalld Status\033[0m"
systemctl status firewalld | grep Active: > net.txt
ccat -G Plaintext=darkred -G Type=darkred net.txt 

echo""
echo -e "\033[1mSelinux Status\033[0m"
getenforce > net.txt
ccat -G Type=darkgreen net.txt

echo""
echo -e "\033[1mConfigured DNS Servers\033[0m"
ccat /etc/resolv.conf | grep nameserver > net.txt
ccat -G Plaintext=green -G Decimal=green net.txt


echo""
echo -e "\033[1mBlue Network IP\033[0m"
ip -brief add | grep ens160 > net.txt
ccat -G Type=blink net.txt 

echo -e "\033[1mRed Network IP\033[0m"
ip -brief add | grep ens224 > net.txt
ccat -G Type=blink -G Decimal=red -G Plaintext=red net.txt

echo""
echo -e "\033[1mHostname Resilution Order\033[0m"
ccat /etc/nsswitch.conf | grep hosts:\* | head -n 1 > net.txt 
ccat -G  Plaintext=purple net.txt

echo""
echo -e "\033[1mContents of Hosts File\033[0m"
ccat -G Plaintext=darkyellow -G Decimal=darkyellow /etc/hosts

echo""
echo -e "\033[1mDefault Gateway\033[0m"
ip route | grep default > net.txt
ccat -G Plaintext=teal -G Decimal=teal net.txt

rm -rf net.txt
