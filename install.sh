#!/bin/bash
export HTTPS_PROXY=http://proxy-chain.intel.com:912
export HTTP_PROXY=http://proxy-chain.intel.com:911
CURRENT_OS=$(hostnamectl | awk '/Operating/ { print $3 }')
echo $CURRENT_OS
if [ $CURRENT_OS == "Fedora" ]
then
        echo "This is Centos based system"
        echo "proxy=http://proxy-chain.intel.com:912" | sudo tee -a /etc/dnf/dnf.conf
        echo "proxy=http://proxy-chain.intel.com:911" | sudo tee -a /etc/dnf/dnf.conf

        sudo yum update -y

        sudo yum install net-tools vim -y

        sudo yum install clang gcc meson libtool -y

        sudo yum install google-perftools libconfig unifdef curl libffi-devel zlib-devel -y

        sudo yum install libedit-devel expat-devel python3-setuptools python3-pip python3-wheel python3-cffi -y

        sudo yum install autoconf-archive connect-proxy wireshark cmake libunwind-devel -y

        python3 -m venv env
        source ./env/bin/activate
        for item in "thrift" "protobuf" "pyelftools" "scapy" "six";
        do
                echo "$item"
                pip3 install "$item"
        done
else
        echo "This is a Debian based system"
        sudo apt update -y

        sudo apt install net-tools vim -y

        sudo apt install clang gcc meson libtool -y

        sudo apt install google-perftools curl libffi-dev zlib-dev -y
	
	sudo apt-get install libconfig-dev unifdef -y

        sudo apt install libedit-dev libexpat1-dev python3-setuptools python3-pip python3-wheel python3-cffi -y

        sudo apt install autoconf-archive connect-proxy wireshark cmake libunwind-dev -y

	sudo apt install python3.8-venv -y

        python3 -m venv env
        source ./env/bin/activate
        for item in "thrift" "protobuf" "pyelftools" "scapy" "six";
        do
                echo "$item"
                pip3 install "$item"
        done

fi

