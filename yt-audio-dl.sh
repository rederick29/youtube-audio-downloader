#!/bin/bash

dateandtime=$(date '+%d-%m-%Y_%H:%M:%S');

if [[ -n "$1" ]]; then
	url=$1
else
	echo "You need to provide an URL!"
	exit 1
fi

if [[ $url = https://youtube.com/watch?v=* ]] || [[ $url = https://m.youtube.com/watch?v=* ]] || [[ $url = https://www.youtube.com/watch?v=* ]] || [[ $url = https://youtu.be/* ]]; then
	echo "Valid URL"
else
	echo "Invalid URL"
	exit 1
fi

if [[ -n "$2" ]]; then
	dir=$2
	if [[ -d $dir ]]; then
		if ! command -v youtube-dl &> /dev/null; then
			echo "youtube-dl is not installed!"
			echo "You should install it using your package manager or from pip."
			read -p "Install youtube-dl using curl now? (y/n) " -r -n 1
				if [[ ! $REPLY =~ ^[Yy]$ ]]; then
					echo " "
					exit 1
				else
					echo " "
					sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
					sudo chmod a+rx /usr/local/bin/youtube-dl
					echo "Installation complete! Please run the script again."
				fi
			exit 0
		else
			youtube-dl -f bestaudio -x -o $dir/$dateandtime'.%(ext).s' --add-metadata $url
			echo "Downloaded at $dir/$dateandtime!"
			exit 0
		fi
	else
		echo "Directory $dir does not exist!"
		exit 1
	fi

else
	if ! command -v youtube-dl &> /dev/null; then
		echo "youtube-dl is not installed!"
		echo "You should install it using your package manager or from pip."
		read -p "Install youtube-dl using curl now? (y/n) " -r -n 1
			if [[ ! $REPLY =~ ^[Yy]$ ]]; then
				echo " "
				exit 1
			else
				echo " "
				sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
				sudo chmod a+rx /usr/local/bin/youtube-dl
				echo "Installation complete! Please run the script again."
			fi
		exit 0
	else
		youtube-dl -f bestaudio -x -o $(pwd)/$dateandtime'.%(ext).s' --add-metadata $url
		echo "Downloaded at $(pwd)/$dateandtime"
	fi
fi
exit 0
