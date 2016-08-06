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

ZNC is running inside container on port 16669 as modern browsers prevent connections to the standard irc ports as security measure. All changing data is kept in **/var/ircstack**, that's the perfected directory to be mounted as docker volume. **Default credentials** to ZNC are **admin:admin**, of course it's user responsibility to change it as fast as possible. 

```bash
docker pull newtype87/ircstack
docker volume create --name ircstack-data
docker run --name ircstack -p 16669:16669  -v  ircstack-data:/var/ircstack newtype87/ircstack
```
