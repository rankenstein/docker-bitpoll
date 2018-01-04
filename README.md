Docker image for [Bitpoll](https://github.com/fsinfuhh/Bitpoll)

Download [settings_local.py](https://raw.githubusercontent.com/fsinfuhh/Bitpoll/master/bitpoll/settings_local.sample.py) and adjust the settings.

```bash
docker run -v "$(readlink -f settings_local.py)" -p 80:8888 --name bitpoll --restart unless-stopped rankenstein/bitpoll
```

```yaml
version: '2'
services:
    dudel:
        container_name: bitpoll
        image: rankenstein/bitpoll
        volumes:
            - ./settings_local.py:/bitpoll/bitpoll/settings_local.py
        ports:
            - 80:8888
        restart: unless-stopped
```

You might want to run a postgres database image and configure the connection in config.py.

On the first run, initialise the database by running (this will delete existing data!):

```bash
docker exec dudel python2 /dudel/scripts/init.py
```
