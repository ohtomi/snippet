# timer

## Usage
```console
$ make build
...
$ make run
...
```
```console
$ docker exec -it snippet bash

root@3dd14015519f:/# systemctl daemon-reload

root@3dd14015519f:/# systemctl status custom-batch.timer
● custom-batch.timer - custom batch timer
   Loaded: loaded (/etc/systemd/system/multi-user.target.wants/custom-batch.timer; bad; vendor preset: enabled)
   Active: active (waiting) since Thu 2019-07-11 11:22:52 UTC; 4min 4s ago

Jul 11 11:22:52 3dd14015519f systemd[1]: Started custom batch timer.
root@3dd14015519f:/# systemctl status custom-batch.service
● custom-batch.service - custom batch service
   Loaded: loaded (/etc/systemd/system/multi-user.target.wants/custom-batch.service; bad; vendor preset: enabled)
   Active: inactive (dead) since Thu 2019-07-11 11:27:06 UTC; 1ms ago
  Process: 94 ExecStart=/usr/local/bin/echo-foo-bar-baz.sh (code=exited, status=0/SUCCESS)
 Main PID: 94 (code=exited, status=0/SUCCESS)

Jul 11 11:27:06 3dd14015519f systemd[1]: Started custom batch service.

root@3dd14015519f:/# ls -la /tmp/
total 36
drwxrwxrwt 1 root root 4096 Jul 11 11:22 .
drwxr-xr-x 1 root root 4096 Jul 11 11:22 ..
-rw-r--r-- 1 root root   72 Jul 11 11:27 timer.log

root@3dd14015519f:/# cat /tmp/timer.log
foo
bar
baz
foo
bar
baz

root@3dd14015519f:/# shutdown
Failed to connect to bus: No such file or directory
Failed to connect to bus: No such file or directory
```

<!--
## Links
- [xxx](https://xxx/)
-->
