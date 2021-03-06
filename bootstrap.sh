sudo apt update
mkdir ~/.setup

fun(){
	echo "Installing the fun stuff...."
	sudo pacaur -Sy arc-gtk-theme spotify transmission-gtk quassel youtube-dl ffmpeg htop
}

essential(){
	echo "Installing the essentials....."
	bash pacaur_install.sh
	sudo pacman -Sy git wget chromium
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

	echo "Installing Insync...."
	cd ~/.setup
	wget http://s.insynchq.com/builds/insync_1.3.12.36116-precise_amd64.deb
	sudo dpkg -i insync_1.3.12.36116-precise_amd64.deb
	rm insync_1.3.12.36116-precise_amd64.deb
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
	essential
	node
	echo "Installing Atom......"
	pacman -S atom
}
node(){
	echo "Installing NodeJS...."
	pacman -Sy nodejs npm
	ln -s /usr/bin/nodejs /usr/bin/node
}
aliases(){
	echo "alias gs='git status'" >> ~/.zshrc
	echo "alias gaa='git add -A'" >> ~/.zshrc
	echo "alias gcm='git commit -m'" >> ~/.zshrc
	echo "alias gpm='git push origin master'" >> ~/.zshrc
	source ~/.zshrc
}

theme(){
	cd ~/.setup
	sudo apt install git unity-tweak-tool gnome-themes-standard gtk2-engines-murrine -y
	git clone https://github.com/vooze/arc-black-ubuntu
	cd arc-black-ubuntu
	sudo cp -R arc-black-ubuntu* /usr/share/themes
}

all(){
    essential
    cloud
    zsh
    fun
    dev_tools
    theme
		aliases
}

$@
