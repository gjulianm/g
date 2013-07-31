#!/bin/sh
install_dir="$HOME/.g"

install_to_rc () {
	config_file="$1"
	if [ -w $1 ]; then
		echo "Installing to $config_file"
		echo "source $install_dir/g.sh" >> $config_file
		echo "source $install_dir/gcompletion.sh" >> $config_file
	fi
}

if [ $# -eq 1 ]; then
	install_dir="$1"
elif [ $# -gt 1 ]; then
	echo "usage: install.sh [install-dir]"
	return
fi

mkdir -p $install_dir
cp ./g.sh ./gcompletion.sh $install_dir
echo "Created install directory $install_dir"

install_to_rc $HOME/.bashrc
install_to_rc $HOME/.zshrc