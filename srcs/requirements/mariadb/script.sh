#!/bin/bash

mv /var/lib/mysql/aria_log_control /var/lib/mysql/aria_log_control.orig 

# Start MariaDB server
exec mysqld --bind-address=0.0.0.0