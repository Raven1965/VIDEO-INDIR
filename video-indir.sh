#!/bin/bash
kontrol=$(which ffmpeg |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m FFMPEG PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install ffmpeg 
fi
kontrol=$(which curl |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURLUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi
kontrol=$(which termux-tts-speak termux-vibrate |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m TERMUX-APİ PAKETİ KURLUYOR"
	echo
	echo
	echo
	pkg install termux-api -y
fi	
if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
cd files
bash güncelleme.sh
clear
bash banner.sh
echo
echo
echo
termux-tts-speak -e com.google.android.tts -l en -p 0.1 -r 0.7 -s MUSIC welcome termux toolss
mp3() {
	if [[ -a /sdcard/TERMUX-MP3 ]];then
		echo
	else
                mkdir /sdcard/TERMUX-MP3
	fi
	sayi=$(ls |grep .mp3 |wc -l)
	if [[ $sayi == 0 ]];then
		echo
		echo
		echo
		printf "\e[33m[*]\e[97m YÜKLÜ MP3 BULUNAMADI"
		echo
		echo
		echo
		cd $HOME
		cd VIDEO-INDIR
		sleep 2
		bash video-indir.sh
		exit
	      fi	
	
}
mp4() {
	if [[ -a /sdcard/TERMUX-VIDEO ]];then
		echo
	else
		mkdir /sdcard/TERMUX-VIDEO
	fi
	sayi=$(ls |grep .mp4 |wc -l)
	if [[ $sayi == 0 ]];then
		echo
		echo
		echo
		printf "\e[33m[*]\e[97m YÜKLÜ VİDEO BULUNAMADI"
		echo
		echo
		echo
		cd $HOME/VIDEO-INDIR 
		sleep 2
		bash video-indir.sh
		exit
	fi
}
m4a() {
	if [[ -a /sdcard/TERMUX-MP3 ]];then
		echo
	else
                mkdir /sdcard/TERMUX-MP3
	fi
	sayi=$(ls |grep .m4a |wc -l)
	if [[ $sayi == 0 ]];then
		echo
		echo
		echo
		printf "\e[33m[*]\e[97m YÜKLÜ MP3 BULUNAMADI"
		echo
		echo
		echo
		cd $HOME
		cd VIDEO-INDIR
		sleep 2
		bash video-indir.sh
		exit
	      fi

}
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mMP3 İNDİR (SADECE YOUTUBE)\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mVİDEO İNDİR\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[32mKLASÖRE KAYDET\e[97m

\e[31m[\e[97mX\e[31m]\e[97m ────────── \e[31mÇIKIŞ\e[97m

"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	echo
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mLİNK GİRİNİZ\e[31m ]───────►  \e[0m' link
	echo
	echo
	echo
	printf "\e[32m[!]\e[97m MP3 İNDİRİLİYOR"
	echo
	echo
	echo
	youtube-dl --extract-audio --audio-format mp3 $link 
	clear
	echo
	echo
	printf "\e[32m[✓]\e[97m MP3 İNDİRİLDİ"
	echo
	sleep 2
	cd $HOME/VIDEO-INDIR
	bash video-indir.sh
	exit
elif [[ $secim == 2 ]];then
	echo
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mLİNK GİRİNİZ\e[31m ]───────►  \e[0m' link
	echo
	echo
	echo
	printf "\e[32m[!]\e[97m VİDEO İNDİRİLİYOR"
	echo
	echo
	echo
	youtube-dl -f mp4 $link
	clear
	echo
	echo
	printf " \e[32m[✓]\e[97m VİDEO İNDİRİLDİ"
	echo
	cd $HOME/VIDEO-INDIR
	sleep 2
	bash video-indir.sh
	exit
elif [[ $secim == 3 ]];then
	echo
	echo
	printf "\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mMP3\e[97m"
	echo
	echo
	echo
        printf "\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mVIDEO\e[97m"
	echo
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
	if [[ $secim == 1 ]];then
		mp3
		mv -v *.mp3 /sdcard/TERMUX-MP3
		clear
		printf "\e[32m[✓]\e[97m MP3 TERMUX-MP3 KLASÖRÜNE TAŞINDI"
		cd $HOME/VIDEO-INDIR
		sleep 2
		bash video-indir.sh
	#	if
		#	m4a
	#		#mv -v *.{mp3,m4a} /sdcard/TERMUX-MP3
	#		clear
	#		printf "\e[32m[✓]\e[97m MP3 TERMUX-MP3 KLASÖRÜNE TAŞINDI"
	#		cd $HOME/VIDEO-INDIR
	#		sleep 2
	#		bash video-indir.sh
	#	 	exit
	#	fi      	
		exit
	elif [[ $secim == 2 ]];then
		mp4
		mv -v *.{mp4,mkv,webm,part} /sdcard/TERMUX-VIDEO
		clear
		printf "\e[32m[✓]\e[97m VİDEO TERMUX-VİDEO KLASÖRÜNE TAŞINDI"
		cd $HOME/VIDEO-INDIR
		sleep 2
		bash video-indir.sh
		exit
	fi        	
elif [[ $secim == x || $secim == X ]];then
	echo
	termux-vibrate -d 55
	echo
	echo
	printf "\e[31m[!]\e[97m ÇIKIŞ YAPILDI"
	echo
	echo
	echo
	exit
else
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM"
	echo
	echo
	echo
	sleep 2
	cd $HOME/VIDEO-INDIR
	bash video-indir.sh
	exit
fi	
 


