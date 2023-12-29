@nightsee
## Current Users Logging Script Documentation

### Purpose:
The purpose of this script is to log information about currently logged-in users to a specified log file. The script retrieves the output of the `who` command, extracts relevant details (username, terminal, login date, and login time), and appends this information to a log file. The log file includes a timestamp indicating when the logging started.

### How To Use:
1- copy the "current_users.service" and "current_users.timer" to "/etc/systemd/system" directory.
###
2- reload the systemd daemon, using this command : "sudo systemctl daemon-reload"
###
3- start the .timer : "sudo systemctl start current_users.timer"
&& wait a minute .

