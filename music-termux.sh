#!/bin/bash
# Script creado por wr3nch

clear

confirm_install() {
    echo "************************************"
    echo "*  Non installed packages..        *"
    echo "*  Do you want to install them  ?  *"
    echo "************************************"
    read -p "Write 'yes' to confirm: " confirm
    if [[ "$confirm" == "yes" ]]; then
        # Actualizar e instalar yt-dlp y mpv
        sudo apt update -y
        sudo apt install -y mpv
        sudo apt install -y yt-dlp
        sudo apt install -y python
        sudo apt install -y pip
        
        # Para termux
        pkg install mpv
        pkg install python
        pkg install pip
        
        pip install yt-dlp
    else
        echo "Instalation canceled."
        exit 1
    fi
}

# Comprobar si yt-dlp y mpv están instalados
if ! command -v yt-dlp &> /dev/null || ! command -v mpv &> /dev/null; then
    confirm_install
fi

echo -e "\n\033[1;31m"
echo "************************************"
echo "*        SEARCH YOUR MUSIC :       *"
echo "************************************"

read -p "Search: " search_query

search_query=$(echo "$search_query" | sed 's/ /+/g')

# Ejecutar la búsqueda y reproducción (Necesarios yt-dpl y mpv)
yt-dlp "ytsearch:$search_query" --no-playlist -f bestaudio -o - | mpv --no-video -
