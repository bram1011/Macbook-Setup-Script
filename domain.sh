#!/bin/bash



password = jmtpwd!2D

#Installs files

echo password | sudo -kS installer -pkg installers/cc.pkg -target /

echo password | sudo -kS installer -pkg installers/office.pkg -target /


echo "Files successfully installed."
