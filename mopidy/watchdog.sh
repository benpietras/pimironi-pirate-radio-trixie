while true; do
    sleep 60
    STATUS=$(mpc -h 127.0.0.1 status 2>/dev/null)
    PLAYING=$(echo "$STATUS" | grep -c "\[playing\]")
    PAUSED=$(echo "$STATUS" | grep -c "\[paused\]")
    if [ "$PLAYING" -eq 0 ] && [ "$PAUSED" -eq 0 ]; then
        echo "$(date): Stream stopped, restarting..."
        mpc -h 127.0.0.1 clear
        mpc -h 127.0.0.1 load kosmos
        mpc -h 127.0.0.1 play
    fi
done
