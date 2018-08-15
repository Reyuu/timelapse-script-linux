#/bin/bash
#tscrot.sh [folder] [time]

#user variables
crop_width=1920
crop_heigth=1080
crop_offsetx=0
crop_offsety=0


#script variables do not edit
count=0
lapse_dir=./$1
bold=$(tput bold)
normal=$(tput sgr0)
green='\033[0;32m'
nc='\033[0m'
greenbold=$bold$green
normalnc=$nc$normal

#https://stackoverflow.com/a/20369590
spinner()
{
    local pid=$!
    local delay=0.25
    #local spinstr='|/-\'
    local spinstr='.-~-'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

#-h --help
if [ $1 = "--help" ] || [ $1 = "-h" ]; then
	echo "$0 ${bold}[folder] [time]"
	echo -e "\t[folder]${normal} creates folder in the same directory as script"
	echo -e "\t${bold}[time]${normal} time in seconds between screen captures"
	echo -e "\n\t${bold}-m --movie [folder] [framerate]${normal}"
	echo -e "\t\toutputs stiched movie from previously taken timelapse"
	exit 1
fi

#-m --movie
#-m [folder] [framerate]
if [ $1 = "--movie" ] || [ $1 = "-m" ]; then
	ffmpeg -loglevel panic -y -r $3 -i "$2/%d.png" -c:v libx264 out.mp4 > /dev/null &
	spinner
	echo -e "${greenbold}OK${normalnc} as out.mp4"
	exit 1
fi

#make screenshot, crop it and echo aOK sign 
mkdir $lapse_dir &> /dev/null
if [ "$?" -gt 0 ]; then
	count=$(cat "$lapse_dir/.last_count")
fi
while [ true ] ; do
	file=$lapse_dir/$count.png
	echo -n $count
	magick import -silent -window root -crop $crop_width\x$crop_heigth+$crop_offsetx+$crop_offsety $file
	count=$(($count+1))
	echo -e "\t${greenbold}OK${normalnc}"
	echo $count > $lapse_dir/.last_count
	sleep $2 & spinner
done
