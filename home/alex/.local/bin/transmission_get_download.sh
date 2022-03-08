if [[ -n "$2" ]]; then
    scp -r "alex@10.0.0.1:/var/lib/transmission-daemon/downloads/$1" $2
elif [[ -n "$1" ]]; then
    scp -r "alex@10.0.0.1:/var/lib/transmission-daemon/downloads/$1" .
else
    echo "provide folder to download"
fi
