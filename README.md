IRCSTACK
========
What's inside
-------------
* Based on Latest Ubuntu LTS
* Latest ZNC from ppa:teward/znc launchpad repository
* znc-palaver compiled buildtime from git repository
* Bitlbee
* Bitlbee facebook-plugin from jgeboski repository
* Services managed by supervisor

How to make it run
-------------------

```bash
docker pull newtype87/ircstack
docker volume create --name ircstack-data
docker run --name ircstack -p 6669:6669  -v  ircstack-data:/var/ircstack newtype87/ircstack
```
