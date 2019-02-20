#!/bin/bash

password="jmtpwd!2D"

#Prompt for linkblue and dept for Mac name

echo "Please enter owner's linkblue: "

read linkblue


echo "Please enter owner's department: "
read dept


echo "Please enter owner's full name: "
fullName = read -r


#Change hostname and computer name to standard format

echo $password | sudo -kS scutil --set HostName $linkblue-$dept

echo $password | sudo scutil --set LocalHostName $linkblue-$dept

echo $password | sudo scutil --set ComputerName $linkblue-$dept


#Flush DNS

dscacheutil -flushcache


echo "Computer successfully named to $linkblue-$dept"


#Add local admin user

echo $password | sudo -kS sysadminctl -addUser $linkblue -fullName $fullName -hint No password -admin


echo "Owner's admin user successfully created"


#Installs files

echo $password | sudo -kS installer -pkg installers/cc.pkg -target /

echo $password | sudo -kS installer -pkg installers/vpn.pkg -target /

echo $password | sudo -kS installer -pkg installers/meraki.pkg -target /

echo $password | sudo -kS installer -pkg installers/office.pkg -target /

echo "Files successfully installed."
