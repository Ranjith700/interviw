#!/bin/bash

# List of servers
servers=("192.168.1.10" "192.168.1.20")
user="ubuntu"

for server in "${servers[@]}"; do
    echo "Checking $server..."

    # Ping check
    if ping -c 1 -W 2 "$server" > /dev/null; then
        echo "$server is reachable"

        # Check Nginx service via SSH
        if ssh "$user@$server" "systemctl is-active --quiet nginx"; then
            echo "Nginx is running on $server"
        else
            echo "Nginx is NOT running on $server"
        fi
    else
        echo "$server is NOT reachable"
    fi

    echo "----------------------"
done
