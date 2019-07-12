# service

## Usage
```console
$ make build
...
$ make run
...
```
```console
$ docker exec -it snippet bash

root@3309928532f1:/# systemctl daemon-reload

root@3309928532f1:/# systemctl start private-tmp-test

root@3309928532f1:/# systemctl status private-tmp-test.service
● private-tmp-test.service - PrivateTmp test
   Loaded: loaded (/etc/systemd/system/multi-user.target.wants/private-tmp-test.service; bad; vendor preset: enabled)
   Active: active (running) since Mon 2019-05-27 11:11:34 UTC; 3min 15s ago
 Main PID: 38 (bash)
   CGroup: /docker/3309928532f1a8bf6859741e798adff74717641fb007fc00c3688ed33c205ef6/system.slice/private-tmp-test.service
           ├─ 38 bash /usr/local/bin/private-tmp-test.sh
           └─284 sleep 1
           ‣ 38 bash /usr/local/bin/private-tmp-test.sh

root@3309928532f1:/# shutdown
Failed to connect to bus: No such file or directory
Failed to connect to bus: No such file or directory
```

<!--
## Links
- [xxx](https://xxx/)
-->
