#!/bin/bash

USER="ircstack"
GROUP="ircstack"

if [ -z "$DISABLE_BITLBEE" ]; then
  if [ ! -d "$IRC_HOME/bitlbee/db" ]; then
      echo "Creating bitlbee config dir"
      mkdir -p "$IRC_HOME/bitlbee/db"
  fi

  if [ ! -f "$IRC_HOME/bitlbee/bitlbee.conf" ]; then
      echo "Install default bitlbee configuration file"
      cp /usr/local/ircstack/bitlbee.conf "$IRC_HOME/bitlbee/bitlbee.conf"
  fi

  mv /etc/supervisor/conf.d/{bitlbee.conf.disabled,bitlbee.conf}
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

mv /etc/supervisor/conf.d/{znc.conf.disabled,znc.conf}

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
