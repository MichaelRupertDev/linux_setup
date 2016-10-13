sudo apt update
mkdir ~/.setup

install_fun(){
	echo "Installing the fun stuff...."
}

install_essential(){
	echo "Installing the essentials....."
	sudo apt install git zsh 
}

install_cloud(){
	cd ~/.setup
	echo "Installing rclone....."

	curl -O http://downloads.rclone.org/rclone-current-linux-amd64.zip
	unzip rclone-current-linux-amd64.zip
	cd rclone-*-linux-amd64
	sudo cp rclone /usr/sbin/
	sudo chown root:root /usr/sbin/rclone
	sudo chmod 755 /usr/sbin/rclone
}

install_zsh(){
	sudo apt install zsh
	cd ~/.setup
	git clone https://github.com/zsh-users/antigen
	git clone https://github.com/powerline/fonts
	cd fonts && ./install.sh && cd ..
	cp ~/linux_setup/.zshrc ~/.zshrc
}

if [ "$1" == "all" ]
then
    install_essential
    install_cloud
    install_fun
else
    install_essential
fi
