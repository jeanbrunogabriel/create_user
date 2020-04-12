#!/bin/bash

while [ 42=42 ];do
	read -p "Type the new user name: " USER_NAME

	if grep $USER_NAME /etc/passwd; then
		echo "ERROR: THIS USER NAME ALREADY EXISTS"
		continue
	else
		echo "--- CREATE USER GROUP ---"
		break
	fi	
done
while [ 42=42 ]; do
	read -p "Type the new group name: " GROUP_NAME

	#Confirms that the name group exists or not
	if  grep $GROUP_NAME /etc/group; then
		echo "ERROR: THIS GROUP NAME IS ALREADY IN USE"
		continue
	else
		groupadd $GROUP_NAME
		echo "GROUP CREATED"
		break
	fi
done
useradd -m -s /bin/bash -g $GROUP_NAME $USER_NAME
passwd $USER_NAME
chown $USER_NAME.$GROUP_NAME /home/$USER_NAME
chmod 1770 /home/$USER_NAME

