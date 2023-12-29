#!/usr/bin/env bash

log_file="/<your own path>/current_users_log.txt"
who_output="$(who)"
current_date_time=$(date +"started loggin from:  %Y-%m-%d %H:%M:%S")
username=$(echo $who_output | cut -d' ' -f 1)
user_terminal=$(echo $who_output | cut -d' ' -f 2)
login_date=$(echo $who_output | cut -d' ' -f 3)
login_time=$(echo $who_output | cut -d' ' -f 4)


if [ "$(wc -l < "$log_file")" -eq 0 ]; then
	echo -e "\n\t$current_date_time\n" > $log_file
	echo -e "\tuser\t\tterminal\t\ŧtime & date" >> $log_file
	while IFS= read -r line; do
		username=$(echo $line | cut -d' ' -f 1)
		user_terminal=$(echo $line | cut -d' ' -f 2)
		login_date=$(echo $line | cut -d' ' -f 3)
		login_time=$(echo $line | cut -d' ' -f 4)
		echo -e "\t$username\t\t$user_terminal\t\t$login_time  $login_date" >> $log_file
	done <<< "$who_output"
else
	while IFS= read -r line; do
                username=$(echo $line | cut -d' ' -f 1)
                user_terminal=$(echo $line | cut -d' ' -f 2)
                login_date=$(echo $line | cut -d' ' -f 3)
                login_time=$(echo $line | cut -d' ' -f 4)
                echo -e "\t$username\t\t$user_terminal\t\t$login_time  $login_date" >> $log_file
        done <<< "$who_output"
fi

