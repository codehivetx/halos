# Super Simple Docker Collaboration Container

## To Use

- build and start

(will stay active in this shell)

```shell
$ docker-compose up
```

- setup

(it won't let you run this twice)

```shell
$ docker-compose exec halos sh /usr/local/sbin/setup.sh salt
```

- add users

```shell
$ docker-compose exec halos sh /usr/local/sbin/add.sh username "User Name"
Changing password for username
New Password:
```

- Log in!

```shell
$ docker-compose exec halos su - username
$ alpine
… send email …
$ salt
> /nick User
> hello
> /quit
```

- Give a login prompt

```shell
docker-compose exec halos login
000000000 login: username
password: …
…
```

## LICENSE

© 2023 [Code Hive Tx, LLC](https://codehivetx.us)
Apache-2.0, see [LICENSE](./LICENSE)
