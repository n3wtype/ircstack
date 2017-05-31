IRCSTACK
========
What's inside
-------------
* Based on Latest [Ubuntu LTS](http://www.ubuntu.com/)
* Latest ZNC from [ppa:teward/znc](https://launchpad.net/~teward/+archive/ubuntu/znc) launchpad repository
* znc-palaver compiled buildtime from [git repository](https://github.com/cocodelabs/znc-palaver)
* znc-playback compiled buildtime from [git repository](https://github.com/jpnurmi/znc-playback)
* znc-clientbuffer compiled buildtime from [git repository](https://github.com/jpnurmi/znc-clientbuffer)
* Bitlbee
* Bitlbee facebook-plugin from [jgeboski](https://jgeboski.github.io) repository
* Services managed by supervisor

How to make it running
-------------------

ZNC runs inside container on port 16669 (modern browsers prevent connections to the standard irc ports as security measure). All changin vatiable user data is being kept in **/var/ircstack**. That's the perfected candidate for being used as docker volume. **Default credentials** to ZNC are **admin:admin**. It's user responsibility to change it as soon as possible.

```bash
docker pull newtype87/ircstack
docker volume create --name ircstack-data
docker run --name ircstack -p 16669:16669  -v  ircstack-data:/var/ircstack newtype87/ircstack
```

How to disable Bitlbee
-----------------------
```bash
docker run --name ircstack -p 16669:16669 \
 -e 'DISABLE_BITLBEE=true' \
 -v  ircstack-data:/var/ircstack newtype87/ircstack
 ```
