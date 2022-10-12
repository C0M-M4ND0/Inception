#!/bin/sh
curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor --silent 

chmod +x /usr/bin/cadvisor 

echo "\e[32mCADVISOR is Running now ...\e[0m"
cadvisor --port=8080 > /dev/null 2>&1