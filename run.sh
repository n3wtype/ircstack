#!/bin/bash

USER="ircstack"
GROUP="ircstack"

if [ ! -d "$IRC_HOME/bitlbee/db" ]; then
    echo "Creating bitlbee config dir"
    mkdir -p "$IRC_HOME/bitlbee/db"
fi

if [ ! -f "$IRC_HOME/bitlbee/bitlbee.conf" ]; then
    echo "Install default bitlbee configuration file"
    cp /usr/local/ircstack/bitlbee.conf "$IRC_HOME/bitlbee/bitlbee.conf"
fi  

if [ ! -d "$IRC_HOME/znc/configs" ]; then
    echo "Create ZNC configuration dir"
    mkdir -p "$IRC_HOME/znc/configs"
fi

if [ ! -f "$IRC_HOME/znc/znc.pem" ]; then
    echo "Generate ZNC SSL certificate"
    znc -p -d "$IRC_HOME/znc/"
fi

if [ ! -f "$IRC_HOME/znc/configs/znc.conf" ]; then
    echo "Install default ZNC configuration file"
    cp /usr/local/ircstack/znc.conf  "$IRC_HOME/znc/configs/znc.conf"
fi


#znc -f -d "$IRC_HOME/znc" & bitlbee -v -I -n -u $USER -c "$IRC_HOME/bitlbee/bitlbee.conf" -d "$IRC_HOME/bitlbee" || exit 1 
/usr/bin/supervisord -c /etc/supervisord.conf
