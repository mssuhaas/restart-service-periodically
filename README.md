# Restart Service Periodically

This script is used to restart a specific service on a Linux system. It also logs the output of the restart command to a temporary file for debugging purposes.

## Usage

The script needs to be executable 
```shelllscript
chmod +x restart_service.sh
```


To use this script as a cron job, open the crontab file with the command:

> **Note:** use the below command as root user, for further issues with permissions! Use `sudo su` to change into root user.

```shellscript
crontab -e
```

Then add a line to the crontab file to schedule the script. For example, to run the script every day at 2 AM, you would add:

```shellscript
0 2 * * * /path/to/restart_service.sh
```

Replace `/path/to/restart_service.sh` with the actual path to the script.

## Functionality

The script defines a function `restart_service` that takes a service name as an argument. It then uses `systemctl` to restart the service, redirecting all output (both stdout and stderr) to a log file in the `/tmp` directory. The name of the log file is `restart_<service_name>.log`.

If the restart command is successful (i.e., it returns a zero exit status), the script prints a success message. If the restart command fails (i.e., it returns a non-zero exit status), the script prints an error message and refers to the log file for more details.

The script then calls the `restart_service` function with the service name "wisun_onem2m" as the argument.

The script ends with an `exit 0` command to ensure that the script itself always returns a zero exit status, regardless of whether the restart was successful or not.

## Requirements

This script requires `bash` and `systemctl`, and it must be run with sufficient permissions to restart services (typically root).


## Created By

- Surya Suhaas Modadugu [(Surya Suhaas)](mailto:mssuhaas@gmail.com)
