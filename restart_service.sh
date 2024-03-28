#!/bin/bash

# Function to restart the service with logging
restart_service() {
  local service_name="$1"
  sudo /usr/bin/systemctl restart "$service_name" &> /tmp/restart_$service_name.log
  if [[ $? -eq 0 ]]; then
    echo "Successfully restarted service: $service_name"
  else
    echo "Error restarting service: $service_name. See /tmp/restart_$service_name.log for details"
  fi
}

# Restart the target service
restart_service "wisun_onem2m"

exit 0
