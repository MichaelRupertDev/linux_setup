sudo apt update
mkdir ~/.setup

fun(){
	echo "Installing the fun stuff...."
}

essential(){
	echo "Installing the essentials....."
	sudo apt install git python python-pip python-virtualenv -y 
}

cloud(){
	cd ~/.setup
	echo "Installing rclone....."

	curl -O http://downloads.rclone.org/rclone-current-linux-amd64.zip
	unzip rclone-current-linux-amd64.zip
	cd rclone-*-linux-amd64
	sudo cp rclone /usr/sbin/
	sudo chown root:root /usr/sbin/rclone
	sudo chmod 755 /usr/sbin/rclone
	rm -rf ~/.setup/rclone*
}

zsh(){
	echo "Configuring zsh...."
	sudo apt install zsh -y
	cd ~/.setup
	git clone https://github.com/zsh-users/antigen
	git clone https://github.com/powerline/fonts
	cd fonts && ./install.sh && cd ..
	cp ~/linux_setup/.zshrc ~/.zshrc
}

dev_tools(){
	echo "Installing Atom......"
	essential
	cd ~/.setup
	wget https://atom.io/download/deb -O atom-amd64.deb
	sudo dpkg -i atom-amd64.deb
	rm atom*	
}

all(){
    install_essential
    install_cloud
    install_zsh
    install_fun
}

$@
